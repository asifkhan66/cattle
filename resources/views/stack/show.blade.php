@extends('layouts.app')

@section('content-header')
    <h1>{{__('stack.stack_details')}}</h1>
    <ol class="breadcrumb">
        <li>
            <a href="{{ route('stack.index') }}">
                <i class="fa fa-dashboard"></i> {{__('stack.stack')}}
            </a>
        </li>
        <li class="active">{{__('commons.details')}}</li>
    </ol>
@endsection

@section('content')

    <div class="box box-default">
        <div class="box-header with-border">
            <h3 class="box-title">
                {{ isset($title) ? ucfirst($title) : 'Stack' }} {{__('commons.full_information')}}
            </h3>

            <div class="box-tools pull-right">

                <form method="POST"
                      action="{!! route('stack.destroy', $stack->id) !!}"
                      accept-charset="UTF-8">
                    <input name="_method" value="DELETE" type="hidden">
                    {{ csrf_field() }}

                    @if (App\Helpers\CommonHelper::isCapable('stack.index'))
                        <a href="{{ route('stack.index') }}" class="btn btn-sm btn-info" title="{{__('buttonTitle.show_all_stack')}}">
                            <i class="fa fa-th-list" aria-hidden="true"></i>
                        </a>
                    @endif

                    @if (App\Helpers\CommonHelper::isCapable('stack.printDetails'))
                        <a href="{{ route('stack.printDetails', $stack->id) }}" class="btn btn-sm btn-warning"
                           title="{{__('buttonTitle.print_details')}}">
                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                        </a>
                    @endif

                    @if (App\Helpers\CommonHelper::isCapable('stack.create'))
                        <a href="{{ route('stack.create') }}" class="btn btn-sm btn-success"
                           title="{{__('buttonTitle.create_new_stack')}}">
                            <i class="fa fa-plus" aria-hidden="true"></i>
                        </a>
                    @endif

                    @if (App\Helpers\CommonHelper::isCapable('stack.edit'))
                        <a href="{{ route('stack.edit', $stack->id ) }}"
                           class="btn btn-sm btn-primary" title="{{__('buttonTitle.edit_stack')}}">
                            <i aria-hidden="true" class="fa fa-pencil"></i>
                        </a>
                    @endif

                    @if (App\Helpers\CommonHelper::isCapable('stack.destroy'))
                        <button type="submit" class="btn btn-sm btn-danger"
                                title="{{__('buttonTitle.delete_stack')}}"
                                onclick="return confirm('Delete Stack?')">
                            <i aria-hidden="true" class="fa fa-trash"></i>
                        </button>
                    @endif

                </form>

            </div>

        </div>

        <div class="box-body">
            <div class="table-responsive">
                <table class="table table-bordered table-show">
                    <tbody>
                    <tr>
                        <th>{{__('stack.stack_name')}}</th>
                        <td>{{ $stack->stack_name }}</td>
                    </tr>

                    <tr>
                        <th>{{__('stack.stack_code')}}</th>
                        <td>{{ $stack->stack_code }}</td>
                    </tr>

                    <tr>
                        <th>{{__('stack.currency_code')}}</th>
                        <td>{{ $stack->currency_code }}</td>
                    </tr>

                    <tr>
                        <th>{{__('stack.capital')}}</th>
                        <td>{{ $stack->capital }}</td>
                    </tr>

                    <tr>
                        <th>{{__('stack.continent_name')}}</th>
                        <td>{{ $stack->continent_name }}</td>
                    </tr>

                    <tr>
                        <th>{{__('stack.continent_code')}}</th>
                        <td>{{ $stack->continent_code }}</td>
                    </tr>

                    <tr>
                        <th>{{__('commons.status')}}</th>
                        <td>{{ $stack->status }}</td>
                    </tr>


                    </tbody>
                </table>
            </div>
        </div>
    </div>

@endsection
