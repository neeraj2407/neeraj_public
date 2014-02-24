var myApp = angular.module('myApp',[]);

function ContactController($scope){
	$scope.contactArray=[];
	var id = 0;	
	$scope.add=function(){
		if($scope.contact && $scope.contact.id==null && $scope.contact.name){			
				$scope.contact.id = id;
				//alert($scope.contact.name+"-----"+$scope.contact.id);
				$scope.contactArray.push($scope.contact);
				id++;			
		}else{
		//if(!$scope.contact.name)
			//alert("");
			for(i in $scope.contactArray){
				if($scope.contactArray[i].id==$scope.contact.id){
					$scope.contactArray[i]=$scope.contact;
				}
			}
			
		}
		$scope.contact={};
	}
	
	$scope.update=function(id){
		for(i in $scope.contactArray){
			if($scope.contactArray[i].id==id){
				$scope.contact=angular.copy($scope.contactArray[i]);
			}
		}
	}

	$scope.delete=function(id){	
		for(i in $scope.contactArray){
			if($scope.contactArray[i].id==id){
				$scope.contactArray.splice(i,1);
				$scope.contact={};
			}
		}
	}	
}

myApp.controller("MyController", function($scope, $http) {
    $scope.myData = {};
    $scope.tagData = [];
    $scope.currentPage = 0;
    $scope.pageSize = 4;
    //$scope.sort = "tagName";
    //$scope.reverse = false;
    $scope.numberOfPages=function(){
      return Math.ceil($scope.tagData.length/$scope.pageSize);                
  }
    
    $scope.doClick = function(item, event) {
      $scope.predicate = "tagName";
      $scope.reverse = false;
      $http({method: 'GET', url: path+ '/getTags?tagName'}).
      success(function(data, status, headers, config) {
        
        $scope.tagData = data;
        
        // this callback will be called asynchronously
        // when the response is available
      }).
      error(function(data, status, headers, config) {
        // called asynchronously if an error occurs
        // or server returns response with an error status.
      });             
    
    } 

});


myApp.filter('startFrom', function() {
  return function(input, start) {
      start = +start; //parse to int
      return input.slice(start);
  }
});




