<html>

<head>

    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	
	<script>
	
	function intersect(a, b)
	{
	  var ai=0, bi=0;
	  var result = new Array();

	  while( ai < a.length && bi < b.length )
	  {
		 if      (a[ai] < b[bi] ){ ai++; }
		 else if (a[ai] > b[bi] ){ bi++; }
		 else /* they're equal */
		 {
		   result.push(a[ai]);
		   ai++;
		   bi++;
		 }
	  }

	  return result;
	}
	
	</script>
	
	
	<script>
	
		function freq(arr) {
			var a = [], b = [], prev;
			
			arr.sort();
			for ( var i = 0; i < arr.length; i++ ) {
				if ( arr[i] !== prev ) {
					a.push(arr[i]);
					b.push(1);
				} else {
					b[b.length-1]++;
				}
				prev = arr[i];
			}
			
			return [a, b];
		}

	
	</script>
	
	
    <script>
	
	function FadeInOutCourses(id, checked) {

		$.ajax({
			type: 'post',
			url: 'courseFadeIn.php',
			data: { "id": id },
			success: function (data) {
				
				var array = data.split(',');
				var i;
					
				if (checked) {
					
					//alert("true = " + id + "  " + array.length + "\n" + data);
					
					for(i=0; i<array.length-1; i++){
					
						document.getElementById(array[i]).style.fontSize  = 'xx-small';
					}
					//alert('array: ' + array + '  ' + array.length);
					
					var mediumCount = 0;
					var mediumList = [];
					$('.coursesSelection').each(function(){
						
						if (this.style.fontSize == 'medium'){
							mediumCount++;
							mediumList.push(this.id);
						}
					});
					
					if(mediumCount == 1) {
							
						alert('You have found a suitable course \n' + document.getElementById(mediumList[0]).getAttribute('name'));
						location.reload();
					}
					
					
				}else {
					
					var all = [];
					var small = [];
					$('.coursesSelection').each(function(){
						
						all.push(this.id);
						if (this.style.fontSize == 'xx-small'){
							small.push(this.id);
						}
					});
					
					var smallArray = intersect(array, small);
					
					var medium_1 = $.grep(all, function(el){return $.inArray(el, small) == -1});
					var medium_2 = $.grep(all, function(el){return $.inArray(el, array) == -1});
					
					//alert('all: ' + all + '\nmedium 1: ' + medium_1 + '\nmedium 2: ' + medium_2 + '\nsmall: ' + small + '\narray: ' + array + '\nsmallArray: ' + smallArray);
					
					var i;
					for(i=0; i<medium_2.length-1; i++){
					
						document.getElementById(medium_2[i]).style.fontSize  = 'medium';
					}
					
					
				}
				

			}
		});
	}
	
	</script>
	
	
	<script>
		$(document).ajaxStart(function(){
          $("#loadingDiv").css("display","block");
        });
        $(document).ajaxComplete(function(){
          $("#loadingDiv").css("display","none");
        });
	</script>
	
	
	<script>
		var globalModulesList = "";
	</script>
	
	
	<script>
	
	
	function checkCheckboxState(id, checked) {
		
		if (checked) {
			
			$.ajax({
				type: "POST",
				url: 'module_disable.php',
				data: { "id": id },
				beforeSend: function(){
					//$("#loading").dialog('open').html("<p>Please Wait...</p>");
				},
				success: function(data) {
					
					var array = data.split(',');
					var i;
					for(i=0; i<array.length-1; i++){
					
						document.getElementById(array[i]).disabled = true;
					}
					FadeInOutCourses(id, true);	//make irrelevant courses smaller
				}
			});
			
		} else {
		//01715090445
			var uniqueIDs = [];
			
			$('.checkBoxSelection').each(function()
			{
				if (this.checked) {
					
					var currID = this.id;
					
					$.ajax({
						type: "POST",
						url: 'module_disable.php',
						data: { "id": currID },
						success: function(data) {
							globalModulesList += data;
						},
						async: false
					});
					FadeInOutCourses(currID, false);
				}
				
			});
			
			var array = globalModulesList.split(","); globalModulesList = "";
			
			if( array.length == 1) {
				$('.checkBoxSelection').each(function(){
					this.disabled = false;
				});
				$('.coursesSelection').each(function(){
					this.style.fontSize = 'medium';
				});
			}
		}
	}
	  
	  
    </script>
  </head>
<body>

<div id='loadingDiv' style="display:none; position:absolute; top: 50%; left: 50%">
    <img src='http://smallenvelop.com/wp-content/uploads/2014/08/Preloader_3.gif' />
</div> 

<form>

<?php
require 'dbConnection.php';

$sql = "select ModuleCode, ModuleTitle, Description from Module";
$result = mysql_query($sql);

if (!$result) {
    echo 'MySQL Error: ' . mysql_error();
    exit;
}

echo "<br><h3>List of modules</h3>";
while ($row = mysql_fetch_row($result)) {
    
echo "<input class=\"checkBoxSelection\" type=\"checkbox\" name=\"moduleGroup[]\" id=\"{$row[0]}\" value=\"{$row[0]}\" onchange=\"checkCheckboxState(this.id, this.checked)\" />
<label for=\"checkbox-1\">{$row[1]}</label> </br>";

}
mysql_close($conn);
?>

</form>


<div id="listOfModules" style="position:absolute; top:17; right:70;"> 

<?php
require 'dbConnection.php';

$sql = "select CourseCode, CourseTitle from Course";
$result = mysql_query($sql);

if (!$result) {
    echo 'MySQL Error: ' . mysql_error();
    exit;
}

echo "<br><h3>List of Courses</h3>";
while ($row = mysql_fetch_row($result)) {
    
	echo "<p style=\"font-size: medium\" class=\"coursesSelection\" id=\"{$row[0]}\" name=\"{$row[1]}\" > {$row[1]} </p> ";

}
mysql_close($conn);
?>
</div>



</body>

</html>