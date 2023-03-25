
<!DOCTYPE html>
	<html>
		<head>
			<title>Data grid</title>


			<script
				src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
				integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
				crossorigin="anonymous">
			</script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
				integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
				crossorigin="anonymous">
			</script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
				integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
				crossorigin="anonymous">
			</script>

			<script src="http://code.jquery.com/jquery-3.3.1.min.js"
				integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
				crossorigin="anonymous">
			</script>
			<link rel="stylesheet"
				href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
			<script
				src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
			</script>


			<style type="text/css">
				.idl { background-color: gray; color: black; padding:
				5px; }
			</style>

		</head>

		<body>

			<div class="container">

				<table class="table table-fluid idl" id="myTable">
					<thead>
						<tr class="idl">
							<th>Name</th>
							<th>ID</th>
							<th>Doj</th>
						</tr>
					</thead>
					<tbody id="qq">
						<tr>
							<td>a</td>
							<td>null</td>
							<td>null</td>
						</tr>

					</tbody>
				</table>
			</div>

			<script>
				$(document).ready(function() { var table =
				$('#myTable').DataTable({ pageLength : 15, lengthMenu :
				[ [ 15, 25, 35 ], [ 15, 25, 35 ] ] }) });
			</script>

		</body>
	</html>
</element>