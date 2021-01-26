<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	if(${login_name eq null}){
		/* convert the alert below to spring error message */
		alert('please log in first.');
		document.location.href = '/ProjectSample003/login/main';
	}else{
		
	}
</script>