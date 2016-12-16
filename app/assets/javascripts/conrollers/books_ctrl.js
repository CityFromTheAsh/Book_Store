// app.controller('BooksCtrl',['Book', 'action', '$scope', function (Book, action, $scope) {
//     //only index
//     action('index',function () {
//         $scope.books = Book.query();
//     });
//     //'/posts/:id'
//     action('show', function (params){
//         $scope.book = Book.get({id: params.id});
//     });
//     //only '/posts/new'
//     action('new', function () {
//         $scope.book = Book.new();
//         $scope.save = Book.create();
//     });
//     //'/posts/:id/edit'
//     action('edit', function (params) {
//         $scope.book = Book.edit({id: params.id});
//         $scope.save = Book.update;
//     });
//     action(['edit', 'new'], function(){
//     });
// }]);
//
//


