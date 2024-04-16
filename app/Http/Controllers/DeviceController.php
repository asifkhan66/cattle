<?php

namespace App\Http\Controllers;

use App\Exports\DeviceExport;
use App\Helpers\CommonHelper;
use App\Models\Device;
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

class DeviceController extends Controller
{
    /**
     * Display a listing of the device.
     *
     * @param Request $request
     * @return View | Response
     * @throws Exception
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            return $this->deviceList($request);
        }

        $device = Device::get();
        return view('device.index', compact('device'));
    }

    public function getQuery(Request $request)
    {
        $query = Device::query();
        if (!empty($request->deviceName)) {
            $query->where('device_name', 'like', '%' . $request->deviceName . '%');
        }

        if (!empty($request->deviceCode)) {
            $query->where('device_code', 'like', '%' . $request->deviceCode . '%');
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
    public function deviceList(Request $request)
    {
        return datatables()->of($this->getQuery($request))
            ->addColumn('action', function ($device) {
                return view('device.action', compact('device'));
            })
            ->addIndexColumn()
            ->rawColumns(['action'])
            ->make(true);
    }

    public function exportXLSX(Request $request)
    {
        return Excel::download(
            new DeviceExport($this->getQuery($request)),
            'device-' . time() . '.xlsx'
        );
    }

    public function printDetails($id)
    {
        set_time_limit(300);
        $device = Device::findOrFail($id);
        $view = view('device.print_details', compact('device'));
        CommonHelper::generatePdf($view->render(), 'device-details-' . date('Ymd'));
    }

    /**
     * Show the form for creating a new device.
     *
     * @return View
     */
    public function create()
    {
        return view('device.create');
    }

    /**
     * Store a new device in the storage.
     *
     * @param Request $request
     * @return RedirectResponse | Redirector
     */
    public function store(Request $request)
    {
        $data = $this->getData($request);
        try {
            Device::create($data);

            if (config('settings.IS_EVENT_LOGS_ENABLE')) {
                EventLog::create([
                    'user_id' => Auth::user()->id,
                    'end_point' => 'device.create',
                    'changes' => EventHelper::logForCreate($data)
                ]);
            }

            return redirect()->route('device.index')
                             ->with('success_message', __('message.device_was_successfully_added'));
        } catch (Exception $exception) {
            return back()->withInput()
                         ->withErrors(['unexpected_error' => $exception->getMessage()]);
        }
    }

    /**
     * Display the specified device.
     *
     * @param int $id
     * @return View
     */
    public function show($id)
    {
        $device = Device::findOrFail($id);
        return view('device.show', compact('device'));
    }

    /**
     * Show the form for editing the specified device.
     *
     * @param int $id
     * @return View
     */
    public function edit($id)
    {
        $device = Device::findOrFail($id);

        return view('device.edit', compact('device'));
    }

    /**
     * Update the specified device in the storage.
     *
     * @param  int $id
     * @param Request $request
     * @return RedirectResponse | Redirector
     */
    public function update($id, Request $request)
    {
        $data = $this->getData($request);
        try {

            $device = Device::findOrFail($id);
            $oldData = $device->toArray();
            $device->update($data);

            if (config('settings.IS_EVENT_LOGS_ENABLE')) {
                EventLog::create([
                    'user_id' => Auth::user()->id,
                    'end_point' => 'device.update',
                    'changes' => EventHelper::logForUpdate($oldData, $data)
                ]);
            }

            return redirect()->route('device.index')
                             ->with('success_message', __('message.device_was_successfully_updated'));
        } catch (Exception $exception) {
            return back()->withInput()
                         ->withErrors(['unexpected_error' => $exception->getMessage()]);
        }
    }

    /**
     * Remove the specified device from the storage.
     *
     * @param  int $id
     * @return RedirectResponse | Redirector
     * @throws \Exception
     */
    public function destroy($id)
    {
        try {
            $device = Device::findOrFail($id);
            $oldData = $device->toArray();
            $device->delete();

            if (config('settings.IS_EVENT_LOGS_ENABLE')) {
                EventLog::create([
                    'user_id' => Auth::user()->id,
                    'end_point' => 'device.destroy',
                    'changes' => EventHelper::logForDelete($oldData)
                ]);
            }

            return redirect()->route('device.index')
                             ->with('success_message', __('message.device_was_successfully_deleted'));
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
            'device_name' => 'required|string|min:1|max:100',
            'device_code' => 'required|string|min:1|max:2',
            'currency_code' => 'nullable|string|min:1|max:3',
            'capital' => 'nullable|string|min:1|max:30',
            'continent_name' => 'required|string|min:1|max:100',
            'continent_code' => 'required|string|min:1|max:2',
            'status' => 'required',

        ]);


        $data['device_name']   = clean($request->device_name);
        $data['device_code']   = clean($request->device_code);
        $data['currency_code']  = clean($request->currency_code);
        $data['capital']        = clean($request->capital);
        $data['continent_name'] = clean($request->continent_name);
        $data['continent_code'] = clean($request->continent_code);


        return $data;
    }

}
