<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="com.sapient.tms.model.bl.CentralLogic" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>
<body>
	<c:if test="${not empty requestScope.err }">
		<p id="errorMessage"><c:out value="${requestScope.err}"></c:out></p>
	</c:if>
	<h1>Enter details</h1>
	<form action="${pageContext.request.contextPath}/SignUp" method="post">
		
		Employee ID: <input type="number" name="id" required/>
		Password: <input type="password" name="password" required/>
		Name: <input type="text" name="name" required/>
		Ride: <br>
		<table>
			<tr>
				<th>Select</th>
				<th>Vehicle</th>
				<th>Pickup Start</th>
				<th>Drop Start</th>
				<th>Seats Allocated / Capacity</th>
			</tr>
			<c:forEach var="ride" items="<%=new CentralLogic().displayAllAvailableRides() %>">
				<tr>
					<td><input type="radio" name="vehicleId" value="${ride.getVehicle().getId()}" /></td>
					<td>${ride.getVehicle().getBrandName()} ${ride.getVehicle().getModelName()}</td>
					<td>${ride.getPickupTime() }</td>
					<td onclick="alert('Drops:\n' + ${ride.getRoute().getDropList().toString()})">${ride.getDropTime() }</td>
					<td>${ride.getSeatsAllocated() } / ${ride.getVehicle().getCapacity() }</td>
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="Submit">
	</form>
</body>
</html>