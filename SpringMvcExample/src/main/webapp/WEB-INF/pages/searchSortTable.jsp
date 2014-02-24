<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html ng-app="myApp">
<head>
<script type="text/javascript">
var path = '<%=request.getContextPath()%>';
</script>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/angular.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/core/contactController.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<link href="<c:url value="/resources/core/style.css" />" rel="stylesheet">
</head>

<body ng-controller="MyController"   >
	<h2>Search</h2>

	<div>
		<input type="text"  id="w-input-search" value="">
		<span>
			<button id="w-button-search" type="button">Search</button>
		</span>
	</div>
	
	<script>
	$(document).ready(function() {

		$('#w-input-search').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getTags',
			paramName: "tagName",
			delimiter: ",",
		    transformResult: function(response) {
		    	
		        return {
		        	
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	
		                return { value: item.tagName, data: item.id };
		            })
		            
		        };
		        
		    }
		    
		});			
	});
	</script>
	<br/><br/><br/>
	
	
<div >
    
    <br/>
  <br/><br/>
    Search: <input ng-model="searchText.$">
    <br/>
   <br/>
     Data from server: 
    <div>
  	
  	 <table width="500px"  bgcolor="green" cellspacing="2px" cellpadding="2px" ng-hide="contactArray.length == 0" ng-init="doClick($event)">
	<thead>
		<tr>
			<th width="100px">Id</th>
			<th width="400px" ><a ng-click="predicate = 'tagName'; reverse=!reverse">Language</a></th>
			<th width="400px"><a ng-click="predicate = 'users'; reverse=!reverse">Users</a></th>
			
		</tr>
	</thead>
	<tbody>
	<tr>
		<td></td>
		<td><input ng-model="searchText.tagName"></td>
		<td><input ng-model="searchText.users"></td>			
	</tr>
		<tr ng-repeat="data in tagData | orderBy:predicate:reverse | filter:searchText | startFrom:currentPage*pageSize | limitTo:pageSize"">
			<td>{{ data.id }}</td>
			<td>{{ data.tagName }}</td>
			<td>{{ data.users }}</td>
			
		</tr>
	</tbody>
	</table>
	<button ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1">
        Previous
    </button>
    {{currentPage+1}}/{{numberOfPages()}}
    <button ng-disabled="currentPage >= tagData.length/pageSize - 1" ng-click="currentPage=currentPage+1">
        Next
    </button>
    </div>
  </div>
  
  
	
	<br/><br/><br/>	
	<div ng-app="" ng-controller="ContactController">    
    <label class="label">Name:</label><input type="text" name="name" ng-model="contact.name"  />
    <label class="label">Email:</label><input type="text" name="email" ng-model="contact.email"/>
	<label class="label">Contact No:</label><input type="text" name="phone" ng-model="contact.phone"/>
        
    <input type="hidden" ng-model="contact.id"/>
    <input type="button" value="Save" ng-click="add()"/>
    
	<table width="800px"  bgcolor="green" cellspacing="2px" cellpadding="2px" ng-hide="contactArray.length == 0">
	<thead>
		<tr>
			<th width="250px">Name</th>
			<th width="250px">Email</th>
			<th width="100px">Contact No</th>
			<th width="200px">Action</th>
		</tr>
	</thead>
	<tbody>
		<tr ng-repeat="contact in contactArray">
			<td>{{ contact.name }}</td>
			<td>{{ contact.email }}</td>
			<td>{{ contact.phone }}</td>
			<td>
				<input type="button" value="Update" ng-click="update(contact.id)" />
				<input type="button" value="Delete" ng-click="delete(contact.id)" />
			</td>
		</tr>
	</tbody>
	</table>
</div>



</body>
</html>