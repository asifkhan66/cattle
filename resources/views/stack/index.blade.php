@extends('layouts.app')

@section('content-header')
    <h1>{{__('stack.stack')}}</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> {{__('stack.stack')}}</a></li>
        <li class="active">{{__('commons.listing')}}</li>
    </ol>
@endsection

@section('content')

    @if(Session::has('success_message'))
        <div class="alert alert-success">
            <span class="glyphicon glyphicon-ok"></span>
            {!! session('success_message') !!}

            <button type="button" class="close" data-dismiss="alert" aria-label="close">
                <span aria-hidden="true">&times;</span>
            </button>

        </div>
    @endif

    <div class="row">
        <div class="col-xs-12">

            <div class="box box-default">
                <div class="box-header with-border">
                    <h3 class="box-title">{{__('commons.filter_box')}}</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-sm btn-default" data-widget="collapse">
                            <i class="fa fa-compress"></i>
                        </button>
                        <a href="{{ route('stack.index') }}" class="btn btn-info btn-sm">
                            <i class="fa fa-refresh"></i> {{__('commons.reset')}}
                        </a>
                        @if (App\Helpers\CommonHelper::isCapable('stack.create'))
                            <a href="{{ route('stack.create') }}"
                               class="btn btn-sm btn-success"
                               title="{{__('buttonTitle.create_new_stack')}}">
                                <i class="fa fa-plus"></i> {{__('commons.create')}}
                            </a>
                        @endif
                    </div>
                </div>

                <div class="box-body">

                    <form id="formSearch" method="POST" class="form-horizontal">
                        <div class="form-group">
                            <label for="macAddress" class="control-label col-lg-2">{{__('stack.macAddress')}}</label>
                            <div class="col-lg-4">
                                <input class="form-control" name="macAddress" id="macAddress">
                            </div>

                            <label for="lastVaccinDate" class="control-label col-lg-2">{{__('stack.lastVaccinDate')}}</label>
                            <div class="col-lg-4">
                                <input class="form-control" name="lastVaccinDate" id="lastVaccinDate">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="description" class="control-label col-lg-2">{{__('stack.description')}}</label>
                            <div class="col-lg-4">
                                <input class="form-control" name="description" id="description">
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="status" class="control-label col-lg-2">{{__('commons.status')}}</label>
                            <div class="col-lg-3">
                                <select class="form-control" name="status" id="status">
                                    <option value="">------ {{__('commons.all')}} ------</option>
                                    <option value="Active">{{__('commons.active')}}</option>
                                    <option value="Inactive">{{__('commons.inactive')}}</option>
                                </select>
                            </div>

                            <div class="col-lg-1">
                                <button type="button" id="btnSearch" class="btn btn-primary pull-right">{{__('commons.go')}}
                                </button>
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body">

                    <div class="table-responsive hide-quick-search">
                        <table id="dataTable" class="table table-bordered table-striped w-100">
                            <thead>
                            <tr>
                                <th>{{__('commons.sl')}}</th>
                                <th>{{__('stack.macAddress')}}</th>
                                <th>{{__('stack.lastVaccinDate')}}</th>
                                <th>{{__('stack.description')}}</th>
                                
                                <th class="text-center mw-100">{{__('commons.action')}}</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
@endsection

<!-- page script -->
@section('javascript')
    <script>
        $(function () {
            "use strict";
            let dataTableUrl = '';
            let dataTable = $('#dataTable').DataTable({
                "order": [[1, "asc"]],
                processing: false,
                serverSide: true,
                ajax: function (data, callback, settings) {
                },
                columns: [
                    {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                    {data: 'macAddress', name: 'macAddress'},
                    {data: 'lastVaccinDate', name: 'lastVaccinDate'},
                    {data: 'description', name: 'description'},
                    
                    {
                        data: 'action',
                        name: 'action',
                        className: "text-center",
                        orderable: false,
                        searchable: false
                    }
                ],
                "pageLength": 10,
                "pagination": true,
                "columnDefs": [
                    {"orderable": false, "targets": -1},
                    {"orderable": false, "targets": 0}
                ],
                initComplete: function () {
                    $('.dataTables_filter').append(`{!! view('commons.button') !!}`);

                    $('#btnExportXLSX').on('click',function () {
                        location.href = '{{ route('stack.exportXLSX') }}' + dataTableUrl;
                    });
                }
            });

            let getUrlQueries = function() {
                let stackName = $('#macAddress').val();
                let stackCode = $('#lastVaccinDate').val();
                let currencyCode = $('#description').val();
                let status = $('#status').val();
                return '?stackName=' + stackName
                    + '&stackCode=' + stackCode
                    + '&currencyCode=' + currencyCode;
            };

            let ajaxRequest = function () {
                dataTableUrl = getUrlQueries();
                dataTable.ajax.url('{{ route('stack.index') }}' + dataTableUrl);
                dataTable.draw();
            };

            ajaxRequest();

            $('#btnSearch').on('click',function () {
                ajaxRequest();
            });

        });
    </script>
@endsection
