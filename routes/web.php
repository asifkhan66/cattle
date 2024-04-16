<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();
Route::get('/', 'HomeController@dashboard')->name('dashboard.index')->middleware('auth');
Route::get('/home', 'HomeController@dashboard')->name('dashboard.index')->middleware('auth');
Route::get('/media', 'HomeController@media')->name('media')->middleware('auth');

Route::group([
    'prefix' => 'roles',
    'middleware' => ['auth', 'checkPermission']
], function () {

    Route::get('/', 'RolesController@index')
        ->name('roles.index');

    Route::get('/create', 'RolesController@create')
        ->name('roles.create');

    Route::get('/show/{role}', 'RolesController@show')
        ->name('roles.show')
        ->where('id', '[0-9]+');

    Route::get('/{role}/edit', 'RolesController@edit')
        ->name('roles.edit')
        ->where('id', '[0-9]+');

    Route::get('/{roleId}/modules/{moduleId?}', 'RolesController@modulePermissions')
        ->name('roles.module-permissions')
        ->where('roleId', '[0-9]+')
        ->where('moduleId', '[0-9]+');

    Route::post('/', 'RolesController@store')
        ->name('roles.store');

    Route::post('/assign_permissions', 'RolesController@assignPermissions')
        ->name('roles.assign_permissions');

    Route::put('role/{role}', 'RolesController@update')
        ->name('roles.update')
        ->where('id', '[0-9]+');

    Route::delete('/role/{role}', 'RolesController@destroy')
        ->name('roles.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','RolesController@exportXLSX')
        ->name('roles.exportXLSX');

    Route::get('/print-details/{id}','RolesController@printDetails')
        ->name('roles.printDetails');
});

Route::group([
    'prefix' => 'permissions',
    'middleware' => ['auth', 'checkPermission']
], function () {

    Route::get('/', 'PermissionsController@index')
        ->name('permissions.index');

    Route::get('/create', 'PermissionsController@create')
        ->name('permissions.create');

    Route::get('/show/{permission}', 'PermissionsController@show')
        ->name('permissions.show')
        ->where('id', '[0-9]+');

    Route::get('/{permission}/edit', 'PermissionsController@edit')
        ->name('permissions.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'PermissionsController@store')
        ->name('permissions.store');

    Route::put('permission/{permission}', 'PermissionsController@update')
        ->name('permissions.update')
        ->where('id', '[0-9]+');

    Route::delete('/permission/{permission}', 'PermissionsController@destroy')
        ->name('permissions.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','PermissionsController@exportXLSX')
        ->name('permissions.exportXLSX');

    Route::get('/print-details/{id}','PermissionsController@printDetails')
        ->name('permissions.printDetails');
});

Route::group([
    'prefix' => 'users',
    'middleware' => ['auth', 'checkPermission']
], function () {

    Route::get('/', 'UsersController@index')
        ->name('users.index');

    Route::get('/create', 'UsersController@create')
        ->name('users.create');

    Route::get('/show/{user}', 'UsersController@show')
        ->name('users.show')
        ->where('id', '[0-9]+');

    Route::get('/{user}/edit', 'UsersController@edit')
        ->name('users.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'UsersController@store')
        ->name('users.store');

    Route::put('user/{user}', 'UsersController@update')
        ->name('users.update')
        ->where('id', '[0-9]+');

    Route::delete('/user/{user}', 'UsersController@destroy')
        ->name('users.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','UsersController@exportXLSX')
        ->name('users.exportXLSX');

    Route::get('/print-details/{id}','UsersController@printDetails')
        ->name('users.printDetails');
});

Route::group([
    'prefix' => 'uploaded_files',
    'middleware' => ['auth', 'checkPermission']
], function () {

    Route::get('/', 'UploadedFilesController@index')
        ->name('uploaded_files.index');

    Route::get('/create', 'UploadedFilesController@create')
        ->name('uploaded_files.create');

    Route::get('/show/{uploadedFile}', 'UploadedFilesController@show')
        ->name('uploaded_files.show')
        ->where('id', '[0-9]+');

    Route::get('/{uploadedFile}/edit', 'UploadedFilesController@edit')
        ->name('uploaded_files.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'UploadedFilesController@store')
        ->name('uploaded_files.store');

    Route::put('uploaded_file/{uploadedFile}', 'UploadedFilesController@update')
        ->name('uploaded_files.update')
        ->where('id', '[0-9]+');

    Route::delete('/uploaded_file/{uploadedFile}', 'UploadedFilesController@destroy')
        ->name('uploaded_files.destroy')
        ->where('id', '[0-9]+');
});

Route::group([
    'prefix' => 'file_types',
    'middleware' => ['auth', 'checkPermission']
], function () {

    Route::get('/', 'FileTypesController@index')
        ->name('file_types.index');

    Route::get('/create', 'FileTypesController@create')
        ->name('file_types.create');

    Route::get('/show/{fileType}', 'FileTypesController@show')
        ->name('file_types.show')
        ->where('id', '[0-9]+');

    Route::get('/{fileType}/edit', 'FileTypesController@edit')
        ->name('file_types.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'FileTypesController@store')
        ->name('file_types.store');

    Route::put('file_type/{fileType}', 'FileTypesController@update')
        ->name('file_types.update')
        ->where('id', '[0-9]+');

    Route::delete('/file_type/{fileType}', 'FileTypesController@destroy')
        ->name('file_types.destroy')
        ->where('id', '[0-9]+');
});

Route::group(
    [
        'prefix' => 'modules',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'ModulesController@index')
        ->name('modules.index');

    Route::get('/create', 'ModulesController@create')
        ->name('modules.create');

    Route::get('/show/{module}', 'ModulesController@show')
        ->name('modules.show')
        ->where('id', '[0-9]+');

    Route::get('/{module}/edit', 'ModulesController@edit')
        ->name('modules.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'ModulesController@store')
        ->name('modules.store');

    Route::put('module/{module}', 'ModulesController@update')
        ->name('modules.update')
        ->where('id', '[0-9]+');

    Route::delete('/{module}', 'ModulesController@destroy')
        ->name('modules.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','ModulesController@exportXLSX')
        ->name('modules.exportXLSX');

    Route::get('/print-details/{id}','ModulesController@printDetails')
        ->name('modules.printDetails');
});

Route::group(
    [
        'prefix' => 'event_logs',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'EventLogsController@index')
        ->name('event_logs.index');

    Route::get('/create', 'EventLogsController@create')
        ->name('event_logs.create');

    Route::get('/show/{eventLog}', 'EventLogsController@show')
        ->name('event_logs.show')
        ->where('id', '[0-9]+');

    Route::get('/{eventLog}/edit', 'EventLogsController@edit')
        ->name('event_logs.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'EventLogsController@store')
        ->name('event_logs.store');

    Route::delete('/event_log/{eventLog}', 'EventLogsController@destroy')
        ->name('event_logs.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','EventLogsController@exportXLSX')
        ->name('event_logs.exportXLSX');

    Route::get('/print-details/{id}','EventLogsController@printDetails')
        ->name('event_logs.printDetails');
});

Route::group(
    [
        'prefix' => 'settings',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'SettingsController@index')
        ->name('settings.index');

    Route::get('/create', 'SettingsController@create')
        ->name('settings.create');

    Route::get('/show/{setting}', 'SettingsController@show')
        ->name('settings.show')
        ->where('id', '[0-9]+');

    Route::get('/{setting}/edit', 'SettingsController@edit')
        ->name('settings.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'SettingsController@store')
        ->name('settings.store');

    Route::put('setting/{setting}', 'SettingsController@update')
        ->name('settings.update')
        ->where('id', '[0-9]+');

    Route::get('/all', 'SettingsController@all')
        ->name('settings.all');

    Route::get('/groups/{groupId?}', 'SettingsController@group')
        ->name('settings.group');

    Route::put('/update_batch', 'SettingsController@updateBatch')
        ->name('settings.update_batch');

    Route::delete('/setting/{setting}', 'SettingsController@destroy')
        ->name('settings.destroy')
        ->where('id', '[0-9]+');
});

Route::group(
    [
        'prefix' => 'breeds',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'BreedsController@index')
        ->name('breeds.index');

    Route::get('/create', 'BreedsController@create')
        ->name('breeds.create');

    Route::get('/show/{breed}', 'BreedsController@show')
        ->name('breeds.show')
        ->where('id', '[0-9]+');

    Route::get('/{breed}/edit', 'BreedsController@edit')
        ->name('breeds.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'BreedsController@store')
        ->name('breeds.store');

    Route::put('breed/{breed}', 'BreedsController@update')
        ->name('breeds.update')
        ->where('id', '[0-9]+');

    Route::delete('/breed/{breed}', 'BreedsController@destroy')
        ->name('breeds.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','BreedsController@exportXLSX')
        ->name('breeds.exportXLSX');

    Route::get('/print-details/{id}','BreedsController@printDetails')
        ->name('breeds.printDetails');
});

Route::group(
    [
        'prefix' => 'milks',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'MilksController@index')
        ->name('milks.index');

    Route::get('/create', 'MilksController@create')
        ->name('milks.create');

    Route::get('/show/{milk}', 'MilksController@show')
        ->name('milks.show')
        ->where('id', '[0-9]+');

    Route::get('/{milk}/edit', 'MilksController@edit')
        ->name('milks.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'MilksController@store')
        ->name('milks.store');

    Route::put('milk/{milk}', 'MilksController@update')
        ->name('milks.update')
        ->where('id', '[0-9]+');

    Route::delete('/milk/{milk}', 'MilksController@destroy')
        ->name('milks.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','MilksController@exportXLSX')
        ->name('milks.exportXLSX');

    Route::get('/print-details/{id}','MilksController@printDetails')
        ->name('milks.printDetails');
});

Route::group(
    [
        'prefix' => 'ledgers',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'LedgersController@index')
        ->name('ledgers.index');

    Route::get('/balance-sheet', 'LedgersController@balanceSheet')
        ->name('ledgers.balanceSheet');

    Route::get('/create', 'LedgersController@create')
        ->name('ledgers.create');

    Route::get('/show/{ledger}', 'LedgersController@show')
        ->name('ledgers.show')
        ->where('id', '[0-9]+');

    Route::get('/{ledger}/edit', 'LedgersController@edit')
        ->name('ledgers.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'LedgersController@store')
        ->name('ledgers.store');

    Route::put('ledger/{ledger}', 'LedgersController@update')
        ->name('ledgers.update')
        ->where('id', '[0-9]+');

    Route::delete('/ledger/{ledger}', 'LedgersController@destroy')
        ->name('ledgers.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','LedgersController@exportXLSX')
        ->name('ledgers.exportXLSX');

    Route::get('/print-details/{id}','LedgersController@printDetails')
        ->name('ledgers.printDetails');

    Route::get('/print-balance-sheet','LedgersController@printBalanceSheet')
        ->name('ledgers.printBalanceSheet');
});

Route::group(
    [
        'prefix' => 'tags',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'TagsController@index')
        ->name('tags.index');

    Route::get('/create', 'TagsController@create')
        ->name('tags.create');

    Route::get('/show/{tag}', 'TagsController@show')
        ->name('tags.show')
        ->where('id', '[0-9]+');

    Route::get('/{tag}/edit', 'TagsController@edit')
        ->name('tags.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'TagsController@store')
        ->name('tags.store');

    Route::put('tag/{tag}', 'TagsController@update')
        ->name('tags.update')
        ->where('id', '[0-9]+');

    Route::delete('/tag/{tag}', 'TagsController@destroy')
        ->name('tags.destroy')
        ->where('id', '[0-9]+');
});

Route::group(
    [
        'prefix' => 'inventories',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'InventoriesController@index')
        ->name('inventories.index');

    Route::get('/create', 'InventoriesController@create')
        ->name('inventories.create');

    Route::get('/show/{inventory}', 'InventoriesController@show')
        ->name('inventories.show')
        ->where('id', '[0-9]+');

    Route::get('/{inventory}/edit', 'InventoriesController@edit')
        ->name('inventories.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'InventoriesController@store')
        ->name('inventories.store');

    Route::put('inventory/{inventory}', 'InventoriesController@update')
        ->name('inventories.update')
        ->where('id', '[0-9]+');

    Route::delete('/inventory/{inventory}', 'InventoriesController@destroy')
        ->name('inventories.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','InventoriesController@exportXLSX')
        ->name('inventories.exportXLSX');

    Route::get('/print-details/{id}','InventoriesController@printDetails')
        ->name('inventories.printDetails');
});

Route::group(
    [
        'prefix' => 'medicines',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'MedicinesController@index')
        ->name('medicines.index');

    Route::get('/create', 'MedicinesController@create')
        ->name('medicines.create');

    Route::get('/show/{medicine}', 'MedicinesController@show')
        ->name('medicines.show')
        ->where('id', '[0-9]+');

    Route::get('/{medicine}/edit', 'MedicinesController@edit')
        ->name('medicines.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'MedicinesController@store')
        ->name('medicines.store');

    Route::put('medicine/{medicine}', 'MedicinesController@update')
        ->name('medicines.update')
        ->where('id', '[0-9]+');

    Route::delete('/medicine/{medicine}', 'MedicinesController@destroy')
        ->name('medicines.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','MedicinesController@exportXLSX')
        ->name('medicines.exportXLSX');

    Route::get('/print-details/{id}','MedicinesController@printDetails')
        ->name('medicines.printDetails');
});

Route::group(
    [
        'prefix' => 'countries',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'CountriesController@index')
        ->name('countries.index');

    Route::get('/create', 'CountriesController@create')
        ->name('countries.create');

    Route::get('/show/{country}', 'CountriesController@show')
        ->name('countries.show')
        ->where('id', '[0-9]+');

    Route::get('/{country}/edit', 'CountriesController@edit')
        ->name('countries.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'CountriesController@store')
        ->name('countries.store');

    Route::put('country/{country}', 'CountriesController@update')
        ->name('countries.update')
        ->where('id', '[0-9]+');

    Route::delete('/country/{country}', 'CountriesController@destroy')
        ->name('countries.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','CountriesController@exportXLSX')
        ->name('countries.exportXLSX');

    Route::get('/print-details/{id}','CountriesController@printDetails')
        ->name('countries.printDetails');
});

Route::group(
    [
        'prefix' => 'inventory_types',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'InventoryTypesController@index')
        ->name('inventory_types.index');

    Route::get('/create', 'InventoryTypesController@create')
        ->name('inventory_types.create');

    Route::get('/show/{inventoryType}', 'InventoryTypesController@show')
        ->name('inventory_types.show')
        ->where('id', '[0-9]+');

    Route::get('/{inventoryType}/edit', 'InventoryTypesController@edit')
        ->name('inventory_types.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'InventoryTypesController@store')
        ->name('inventory_types.store');

    Route::put('inventory_type/{inventoryType}', 'InventoryTypesController@update')
        ->name('inventory_types.update')
        ->where('id', '[0-9]+');

    Route::delete('/inventory_type/{inventoryType}', 'InventoryTypesController@destroy')
        ->name('inventory_types.destroy')
        ->where('id', '[0-9]+');
});

Route::group(
    [
        'prefix' => 'inventory_units',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'InventoryUnitsController@index')
        ->name('inventory_units.index');

    Route::get('/create', 'InventoryUnitsController@create')
        ->name('inventory_units.create');

    Route::get('/show/{inventoryUnit}', 'InventoryUnitsController@show')
        ->name('inventory_units.show')
        ->where('id', '[0-9]+');

    Route::get('/{inventoryUnit}/edit', 'InventoryUnitsController@edit')
        ->name('inventory_units.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'InventoryUnitsController@store')
        ->name('inventory_units.store');

    Route::put('inventory_unit/{inventoryUnit}', 'InventoryUnitsController@update')
        ->name('inventory_units.update')
        ->where('id', '[0-9]+');

    Route::delete('/inventory_unit/{inventoryUnit}', 'InventoryUnitsController@destroy')
        ->name('inventory_units.destroy')
        ->where('id', '[0-9]+');
});

Route::group(
    [
        'prefix' => 'inventory_stocks',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'InventoryStocksController@index')
        ->name('inventory_stocks.index');

    Route::get('/create/inventories/{inventoryId}', 'InventoryStocksController@create')
        ->name('inventory_stocks.create')
        ->where('inventoryId', '[0-9]+');

    Route::get('/consume/inventories/{inventoryId}', 'InventoryStocksController@consume')
        ->name('inventory_stocks.consume')
        ->where('inventoryId', '[0-9]+');

    Route::get('/details/inventories/{inventoryId}', 'InventoryStocksController@details')
        ->name('inventory_stocks.details')
        ->where('inventoryId', '[0-9]+');

    Route::get('/show/{inventoryStock}', 'InventoryStocksController@show')
        ->name('inventory_stocks.show')
        ->where('id', '[0-9]+');

    Route::get('/{inventoryStock}/edit', 'InventoryStocksController@edit')
        ->name('inventory_stocks.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'InventoryStocksController@store')
        ->name('inventory_stocks.store');

    Route::put('inventory_stock/{inventoryStock}', 'InventoryStocksController@update')
        ->name('inventory_stocks.update')
        ->where('id', '[0-9]+');

    Route::delete('/inventory_stock/{inventoryStock}', 'InventoryStocksController@destroy')
        ->name('inventory_stocks.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','InventoryStocksController@exportXLSX')
        ->name('inventory_stocks.exportXLSX');

    Route::get('/print-details/{id}','InventoryStocksController@printDetails')
        ->name('inventory_stocks.printDetails');
});

Route::group(
[
    'prefix' => 'leaves',
    'middleware' => ['auth', 'checkPermission']
], function () {

    Route::get('/', 'LeavesController@index')
         ->name('leaves.index');

    Route::get('/create','LeavesController@create')
         ->name('leaves.create');

    Route::get('/show/{leave}','LeavesController@show')
         ->name('leaves.show')
         ->where('id', '[0-9]+');

    Route::get('/details/employee/{employeeId}','LeavesController@leaveDetails')
        ->name('leaves.leaveDetails')
        ->where('employeeId', '[0-9]+');

    Route::get('/{leave}/edit','LeavesController@edit')
         ->name('leaves.edit')
         ->where('id', '[0-9]+');

    Route::post('/', 'LeavesController@store')
         ->name('leaves.store');

    Route::put('leave/{leave}', 'LeavesController@update')
         ->name('leaves.update')
         ->where('id', '[0-9]+');

    Route::delete('/leave/{leave}','LeavesController@destroy')
         ->name('leaves.destroy')
         ->where('id', '[0-9]+');

    Route::get('/export-xlsx','LeavesController@exportXLSX')
        ->name('leaves.exportXLSX');

    Route::get('/print-details/{id}','LeavesController@printDetails')
        ->name('leaves.printDetails');
});

Route::group(
[
    'prefix' => 'salaries',
    'middleware' => ['auth', 'checkPermission']
], function () {

    Route::get('/', 'SalariesController@index')
         ->name('salaries.index');

    Route::get('/create','SalariesController@create')
         ->name('salaries.create');

    Route::get('/show/{salary}','SalariesController@show')
         ->name('salaries.show')
         ->where('id', '[0-9]+');

    Route::get('/details/employee/{employeeId}','SalariesController@salaryDetails')
        ->name('salaries.salaryDetails')
        ->where('employeeId', '[0-9]+');

    Route::get('/{salary}/edit','SalariesController@edit')
         ->name('salaries.edit')
         ->where('id', '[0-9]+');

    Route::post('/', 'SalariesController@store')
         ->name('salaries.store');

    Route::put('salary/{salary}', 'SalariesController@update')
         ->name('salaries.update')
         ->where('id', '[0-9]+');

    Route::delete('/salary/{salary}','SalariesController@destroy')
         ->name('salaries.destroy')
         ->where('id', '[0-9]+');

    Route::get('/export-xlsx','SalariesController@exportXLSX')
        ->name('salaries.exportXLSX');

    Route::get('/print-details/{id}','SalariesController@printDetails')
        ->name('salaries.printDetails');
});

Route::group(
[
    'prefix' => 'cattle_types',
    'middleware' => ['auth', 'checkPermission']
], function () {

    Route::get('/', 'CattleTypesController@index')
         ->name('cattle_types.index');

    Route::get('/create','CattleTypesController@create')
         ->name('cattle_types.create');

    Route::get('/show/{cattleType}','CattleTypesController@show')
         ->name('cattle_types.show')
         ->where('id', '[0-9]+');

    Route::get('/{cattleType}/edit','CattleTypesController@edit')
         ->name('cattle_types.edit')
         ->where('id', '[0-9]+');

    Route::post('/', 'CattleTypesController@store')
         ->name('cattle_types.store');

    Route::put('cattle_type/{cattleType}', 'CattleTypesController@update')
         ->name('cattle_types.update')
         ->where('id', '[0-9]+');

    Route::delete('/cattle_type/{cattleType}','CattleTypesController@destroy')
         ->name('cattle_types.destroy')
         ->where('id', '[0-9]+');

    Route::get('/export-xlsx','CattleTypesController@exportXLSX')
        ->name('cattle_types.exportXLSX');

    Route::get('/print-details/{id}','CattleTypesController@printDetails')
        ->name('cattle_types.printDetails');
});

Route::group(
[
    'prefix' => 'cattle',
    'middleware' => ['auth', 'checkPermission']
], function () {

    Route::get('/', 'CattleController@index')
         ->name('cattle.index');

    Route::get('/body-weight/{cattleId}','CattleController@bodyWeight')
        ->name('cattle.bodyWeight');

    Route::post('/body-weight', 'CattleController@storeBodyWeight')
        ->name('cattle.storeBodyWeight');

    Route::put('/body-weight/{bodyWeightId}', 'CattleController@updateBodyWeight')
        ->name('cattle.updateBodyWeight');

    Route::delete('/body-weight/{bodyWeightId}','CattleController@destroyBodyWeight')
        ->name('cattle.destroyBodyWeight')
        ->where('id', '[0-9]+');

    Route::get('/costs/{cattleId}','CattleController@cost')
        ->name('cattle.costs');

    Route::post('/costs', 'CattleController@storeCost')
        ->name('cattle.storeCost');

    Route::put('/costs/{costId}', 'CattleController@updateCost')
        ->name('cattle.updateCost');

    Route::delete('/costs/{costId}','CattleController@destroyCost')
        ->name('cattle.destroyCost')
        ->where('costId', '[0-9]+');

    Route::get('/create','CattleController@create')
         ->name('cattle.create');

    Route::get('/show/{cattle}','CattleController@show')
         ->name('cattle.show')
         ->where('id', '[0-9]+');

    Route::get('/{cattle}/edit','CattleController@edit')
         ->name('cattle.edit')
         ->where('id', '[0-9]+');

    Route::post('/', 'CattleController@store')
         ->name('cattle.store');

    Route::put('cattle/{cattle}', 'CattleController@update')
         ->name('cattle.update')
         ->where('id', '[0-9]+');

    Route::delete('/cattle/{cattle}','CattleController@destroy')
         ->name('cattle.destroy')
         ->where('id', '[0-9]+');

    Route::get('/export-xlsx','CattleController@exportXLSX')
        ->name('cattle.exportXLSX');

    Route::get('/print-details/{id}','CattleController@printDetails')
        ->name('cattle.printDetails');
});

Route::group(
[
    'prefix' => 'daily_wages',
    'middleware' => ['auth', 'checkPermission']
], function () {

    Route::get('/', 'DailyWagesController@index')
         ->name('daily_wages.index');

    Route::get('/create','DailyWagesController@create')
         ->name('daily_wages.create');

    Route::get('/show/{dailyWage}','DailyWagesController@show')
         ->name('daily_wages.show')
         ->where('id', '[0-9]+');

    Route::get('/{dailyWage}/edit','DailyWagesController@edit')
         ->name('daily_wages.edit')
         ->where('id', '[0-9]+');

    Route::post('/', 'DailyWagesController@store')
         ->name('daily_wages.store');

    Route::put('daily_wage/{dailyWage}', 'DailyWagesController@update')
         ->name('daily_wages.update')
         ->where('id', '[0-9]+');

    Route::delete('/daily_wage/{dailyWage}','DailyWagesController@destroy')
         ->name('daily_wages.destroy')
         ->where('id', '[0-9]+');

    Route::get('/export-xlsx','DailyWagesController@exportXLSX')
        ->name('daily_wages.exportXLSX');

    Route::get('/print-details/{id}','DailyWagesController@printDetails')
        ->name('daily_wages.printDetails');
});




//New route for devices



Route::group(
    [
        'prefix' => 'device',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'DeviceController@index')
        ->name('device.index');

    Route::get('/create', 'DeviceController@create')
        ->name('device.create');

    Route::get('/show/{country}', 'DeviceController@show')
        ->name('device.show')
        ->where('id', '[0-9]+');

    Route::get('/{country}/edit', 'DeviceController@edit')
        ->name('device.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'DeviceController@store')
        ->name('device.store');

    Route::put('country/{country}', 'DeviceController@update')
        ->name('device.update')
        ->where('id', '[0-9]+');

    Route::delete('/country/{country}', 'DeviceController@destroy')
        ->name('device.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','DeviceController@exportXLSX')
        ->name('device.exportXLSX');

    Route::get('/print-details/{id}','DeviceController@printDetails')
        ->name('device.printDetails');
});


//New route for stack


Route::group(
    [
        'prefix' => 'stack',
        'middleware' => ['auth', 'checkPermission']
    ], function () {

    Route::get('/', 'StackController@index')
        ->name('stack.index');

    Route::get('/create', 'StackController@create')
        ->name('stack.create');

    Route::get('/show/{country}', 'StackController@show')
        ->name('stack.show')
        ->where('id', '[0-9]+');

    Route::get('/{country}/edit', 'StackController@edit')
        ->name('stack.edit')
        ->where('id', '[0-9]+');

    Route::post('/', 'StackController@store')
        ->name('stack.store');

    Route::put('country/{country}', 'StackController@update')
        ->name('stack.update')
        ->where('id', '[0-9]+');

    Route::delete('/country/{country}', 'StackController@destroy')
        ->name('stack.destroy')
        ->where('id', '[0-9]+');

    Route::get('/export-xlsx','StackController@exportXLSX')
        ->name('stack.exportXLSX');

    Route::get('/print-details/{id}','StackController@printDetails')
        ->name('stack.printDetails');
});