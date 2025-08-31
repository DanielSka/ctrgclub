function SubscribeMe() {
    alert('SubscribeMe in scripts.');
    var email = document.getElementById('SubscribeEmail').value;
    if (email != "") {
        alert(email);

        $.ajax({
            type: "POST", url: "http://localhost/SiteHelper/SiteHelper.svc/SubscribeEmail",
            async: false,
            data: email,
            contentType: "text/plain",
            //data: '{"email":"' + email + '"}',
            //contentType: "application/json; charset=utf-8",
            //data: JSON.stringify(data),
            dataType: "text",
            success: onSucess, error: onError
        });

        function onSucess(result) {
            alert('Sucess.');
            alert(result);
        }
        function onError(result) {
            alert('Something wrong.');
        }
    }
}

function RegisterNewPerson() {
    alert('Processing RegisterNewPerson.');
    var firstName = document.getElementById('firstName').value;
    var lastName = document.getElementById('lastName').value;
    var email = document.getElementById('email').value;
    var cellPhone = document.getElementById('cellPhone').value;
    var homePhone = document.getElementById('homePhone').value;
    var street = document.getElementById('street').value;
    var city = document.getElementById('city').value;
    var state = document.getElementById('state').value;
    var zip = document.getElementById('zip').value;

    $.ajax({
        type: "POST", url: "http://localhost/SiteHelper/SiteHelper.svc/RegisterContact",
        async: false,
        data: '{"firstName":"' + firstName + '", "lastName":"' + lastName + '",  "email":"' + email + '", "cellPhone":"' + cellPhone + '","homePhone":"' + homePhone + '","street":"' + street + '","city":"' + city + '","state":"' + state + '","zip":"' + zip + '"}',
        contentType: "application/json; charset=utf-8",
        success: onSucess, error: onError
    });

    function onSucess(result) {
        alert('Sucess.');
        alert(result);
    }
    function onError(result) {
        alert('Error.');
        alert(result);
    }
}