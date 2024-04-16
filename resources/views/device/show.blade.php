@extends('layouts.app')

@section('content-header')
    <h1>{{__('device.device_details')}}</h1>
    <ol class="breadcrumb">
        <li>
            <a href="{{ route('device.index') }}">
                <i class="fa fa-dashboard"></i> {{__('device.device')}}
            </a>
        </li>
        <li class="active">{{__('commons.details')}}</li>
    </ol>
@endsection

@section('content')

    <div class="box box-default">
        <div class="box-header with-border">
            <h3 class="box-title">
                {{ isset($title) ? ucfirst($title) : 'Device' }} {{__('commons.full_information')}}
            </h3>

            <div class="box-tools pull-right">

                <form method="POST"
                      action="{!! route('device.destroy', $device->id) !!}"
                      accept-charset="UTF-8">
                    <input name="_method" value="DELETE" type="hidden">
                    {{ csrf_field() }}

                    @if (App\Helpers\CommonHelper::isCapable('device.index'))
                        <a href="{{ route('device.index') }}" class="btn btn-sm btn-info" title="{{__('buttonTitle.show_all_device')}}">
                            <i class="fa fa-th-list" aria-hidden="true"></i>
                        </a>
                    @endif

                    @if (App\Helpers\CommonHelper::isCapable('device.printDetails'))
                        <a href="{{ route('device.printDetails', $device->id) }}" class="btn btn-sm btn-warning"
                           title="{{__('buttonTitle.print_details')}}">
                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                        </a>
                    @endif

                    @if (App\Helpers\CommonHelper::isCapable('device.create'))
                        <a href="{{ route('device.create') }}" class="btn btn-sm btn-success"
                           title="{{__('buttonTitle.create_new_device')}}">
                            <i class="fa fa-plus" aria-hidden="true"></i>
                        </a>
                    @endif

                    @if (App\Helpers\CommonHelper::isCapable('device.edit'))
                        <a href="{{ route('device.edit', $device->id ) }}"
                           class="btn btn-sm btn-primary" title="{{__('buttonTitle.edit_device')}}">
                            <i aria-hidden="true" class="fa fa-pencil"></i>
                        </a>
                    @endif

                    @if (App\Helpers\CommonHelper::isCapable('device.destroy'))
                        <button type="submit" class="btn btn-sm btn-danger"
                                title="{{__('buttonTitle.delete_device')}}"
                                onclick="return confirm('Delete Device?')">
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
                        <th>{{__('device.device_name')}}</th>
                        <td>{{ $device->device_name }}</td>
                    </tr>

                    <tr>
                        <th>{{__('device.device_code')}}</th>
                        <td>{{ $device->device_code }}</td>
                    </tr>

                    <tr>
                        <th>{{__('device.currency_code')}}</th>
                        <td>{{ $device->currency_code }}</td>
                    </tr>

                    <tr>
                        <th>{{__('device.capital')}}</th>
                        <td>{{ $device->capital }}</td>
                    </tr>

                    <tr>
                        <th>{{__('device.continent_name')}}</th>
                        <td>{{ $device->continent_name }}</td>
                    </tr>

                    <tr>
                        <th>{{__('device.continent_code')}}</th>
                        <td>{{ $device->continent_code }}</td>
                    </tr>

                    <tr>
                        <th>{{__('commons.status')}}</th>
                        <td>{{ $device->status }}</td>
                    </tr>


                    </tbody>
                </table>
            </div>
        </div>
    </div>

@endsection
