<?php
Route::group(['namespace' => 'Statistics','middleware' => ['web']], function () {
  Route::any('admin/form/list/ajax','FormAjaxController@dataList');
  Route::any('admin/form/export/excel','FormAjaxController@exportExcel');
  Route::any('admin/form/show/{id}','FormController@show');
  Route::any('admin/questionnaire/show/{id}','QuestionnaireController@show');
});

Route::group(['namespace' => 'Statistics','middleware' => ['admin']], function () {
  Route::get('admin/form/list','FormController@index');
  Route::get('admin/questionnaire/list','QuestionnaireController@index');
});