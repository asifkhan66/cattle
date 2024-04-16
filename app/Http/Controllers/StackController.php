<?php

namespace App\Http\Controllers;

use App\Exports\StackExport;
use App\Helpers\CommonHelper;
use App\Models\Stack;
use Exception;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Routing\Redirector;
use Illuminate\Http\RedirectResponse;
use App\Models\EventLog;
use App\Helpers\EventHelper;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Auth;
use Response;

class StackController extends Controller
{
    /**
     * Display a listing of the stack.
     *
     * @param Request $request
     * @return View | Response
     * @throws Exception
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            return $this->stackList($request);
        }

        $stack = Stack::get();
        return view('stack.index', compact('stack'));
    }

    public function getQuery(Request $request)
    {
        $query = Stack::query();
        if (!empty($request->stackName)) {
            $query->where('stack_name', 'like', '%' . $request->stackName . '%');
        }

        if (!empty($request->stackCode)) {
            $query->where('stack_code', 'like', '%' . $request->stackCode . '%');
        }

        if (!empty($request->currencyCode)) {
            $query->where('currency_code', 'like', '%' . $request->currencyCode . '%');
        }

        if (!empty($request->capital)) {
            $query->where('capital', 'like', '%' . $request->capital . '%');
        }

        if (!empty($request->continentName)) {
            $query->where('continent_name', 'like', '%' . $request->continentName . '%');
        }

        if (!empty($request->status)) {
            $query->where('status', $request->status);
        }

        return $query;
    }

    /**
     * Display a json listing for table body.
     *
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    public function stackList(Request $request)
    {
        return datatables()->of($this->getQuery($request))
            ->addColumn('action', function ($stack) {
                return view('stack.action', compact('stack'));
            })
            ->addIndexColumn()
            ->rawColumns(['action'])
            ->make(true);
    }

    public function exportXLSX(Request $request)
    {
        return Excel::download(
            new StackExport($this->getQuery($request)),
            'stack-' . time() . '.xlsx'
        );
    }

    public function printDetails($id)
    {
        set_time_limit(300);
        $stack = Stack::findOrFail($id);
        $view = view('stack.print_details', compact('stack'));
        CommonHelper::generatePdf($view->render(), 'stack-details-' . date('Ymd'));
    }

    /**
     * Show the form for creating a new stack.
     *
     * @return View
     */
    public function create()
    {
        return view('stack.create');
    }

    /**
     * Store a new stack in the storage.
     *
     * @param Request $request
     * @return RedirectResponse | Redirector
     */
    public function store(Request $request)
    {
        $data = $this->getData($request);
        try {
            Stack::create($data);

            if (config('settings.IS_EVENT_LOGS_ENABLE')) {
                EventLog::create([
                    'user_id' => Auth::user()->id,
                    'end_point' => 'stack.create',
                    'changes' => EventHelper::logForCreate($data)
                ]);
            }

            return redirect()->route('stack.index')
                             ->with('success_message', __('message.stack_was_successfully_added'));
        } catch (Exception $exception) {
            return back()->withInput()
                         ->withErrors(['unexpected_error' => $exception->getMessage()]);
        }
    }

    /**
     * Display the specified stack.
     *
     * @param int $id
     * @return View
     */
    public function show($id)
    {
        $stack = Stack::findOrFail($id);
        return view('stack.show', compact('stack'));
    }

    /**
     * Show the form for editing the specified stack.
     *
     * @param int $id
     * @return View
     */
    public function edit($id)
    {
        $stack = Stack::findOrFail($id);

        return view('stack.edit', compact('stack'));
    }

    /**
     * Update the specified stack in the storage.
     *
     * @param  int $id
     * @param Request $request
     * @return RedirectResponse | Redirector
     */
    public function update($id, Request $request)
    {
        $data = $this->getData($request);
        try {

            $stack = Stack::findOrFail($id);
            $oldData = $stack->toArray();
            $stack->update($data);

            if (config('settings.IS_EVENT_LOGS_ENABLE')) {
                EventLog::create([
                    'user_id' => Auth::user()->id,
                    'end_point' => 'stack.update',
                    'changes' => EventHelper::logForUpdate($oldData, $data)
                ]);
            }

            return redirect()->route('stack.index')
                             ->with('success_message', __('message.stack_was_successfully_updated'));
        } catch (Exception $exception) {
            return back()->withInput()
                         ->withErrors(['unexpected_error' => $exception->getMessage()]);
        }
    }

    /**
     * Remove the specified stack from the storage.
     *
     * @param  int $id
     * @return RedirectResponse | Redirector
     * @throws \Exception
     */
    public function destroy($id)
    {
        try {
            $stack = Stack::findOrFail($id);
            $oldData = $stack->toArray();
            $stack->delete();

            if (config('settings.IS_EVENT_LOGS_ENABLE')) {
                EventLog::create([
                    'user_id' => Auth::user()->id,
                    'end_point' => 'stack.destroy',
                    'changes' => EventHelper::logForDelete($oldData)
                ]);
            }

            return redirect()->route('stack.index')
                             ->with('success_message', __('message.stack_was_successfully_deleted'));
        } catch (Exception $exception) {
            return back()->withInput()
                         ->withErrors(['unexpected_error' => 'Unexpected error occurred while trying to process your request!']);
        }
    }


    /**
     * Get the request's data from the request.
     *
     * @param Request $request
     * @return array
     */
    protected function getData(Request $request)
    {
        $data = $request->validate([
            'stack_name' => 'required|string|min:1|max:100',
            'stack_code' => 'required|string|min:1|max:2',
            'currency_code' => 'nullable|string|min:1|max:3',
            'capital' => 'nullable|string|min:1|max:30',
            'continent_name' => 'required|string|min:1|max:100',
            'continent_code' => 'required|string|min:1|max:2',
            'status' => 'required',

        ]);


        $data['stack_name']   = clean($request->stack_name);
        $data['stack_code']   = clean($request->stack_code);
        $data['currency_code']  = clean($request->currency_code);
        $data['capital']        = clean($request->capital);
        $data['continent_name'] = clean($request->continent_name);
        $data['continent_code'] = clean($request->continent_code);


        return $data;
    }

}
