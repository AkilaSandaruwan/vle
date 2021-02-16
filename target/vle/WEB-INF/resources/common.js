function setUrl(url){
    document.getElementById('delete_url').href=url;
}

function setUrl_file(url){
    document.getElementById('delete_file_action').href=url;
}
function setUrl_attachmentForm(url){
    document.getElementById('add_attachment').action=url;
}

function setButton(){
    document.getElementById("submitbtn").style.display="";

}

function setPhoto(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#image')
                .css({"backgroundImage":'url(e.target.result)'});
        };

        reader.readAsDataURL(input.files[0]);
    }
}
function emailValidation(email){
    let regx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$"

    if (email.match(regx) || email===""){
        document.getElementById("email_e").innerText="";
        return true;
    }else{
        document.getElementById("email_e").innerText="Invalid email.";
        return false
    }

}

function password_validate(password){
    let mFormat = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,20}$";

    if (password.match(mFormat)){
        document.getElementById('password_warn').innerHTML='';
        console.log("akila");
        return true;
    }else{
        document.getElementById('password_warn').innerHTML='Password should contain uppercase lowercase digit characters.';
        return false;
    }
}

function password_match(){
    let pwd = document.getElementById("npwd").value;
    let cpwd = document.getElementById('cpassword').value;

    if (pwd!=cpwd){
        document.getElementById('pwd_warn').innerHTML='Password dose not match!';
        console.log("Akila");
        console.log(pwd);
        console.log(cpwd);
        return false;
    }else if(pwd==cpwd){
        document.getElementById('pwd_warn').innerHTML='';
        console.log("match bro");
        return true;
    }
}

function mobileValidation(mobile){
    let regx = "^07[0,1,2,5,6,7,8][0-9]{7}"

    if (!mobile.match(regx) || mobile.length!==10){
        document.getElementById('mobile_e').innerHTML='Invalid phone number.';
        return false;
    }else{
        document.getElementById('mobile_e').innerHTML='';
        return true;
    }

}

function homeValidation(home){
    let regx = "^0[1,2,,3,4,5,6,7,8][1,2,3,4,5,6,7,8][0-9]{7}"

    if (!home.match(regx) || home.length!==10){
        document.getElementById('home_e').innerHTML='Invalid phone number.';
        return false;
    }else{
        document.getElementById('home_e').innerHTML='';
        return true;
    }

}
function nicValidation(nic){
    let regx = "^[8,9][0-9]{8}[V,v]"

    if (!nic.match(regx) || nic.length!==10){
        document.getElementById('nic_e').innerHTML='Invalid NIC number.';
        return false;
    }else{
        document.getElementById('nic_e').innerHTML='';
        return true;
    }

}

function searchFun() {
    // Declare variables
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");



    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        var found=false;
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
               found=true;
            }
            // else {
            //     tr[i].style.display = "none";
            // }
        }
        td = tr[i].getElementsByTagName("td")[1];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                found=true;
            }

        }
        td = tr[i].getElementsByTagName("td")[2];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                found=true;
            }

        }
        td = tr[i].getElementsByTagName("td")[3];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                found=true;
            }

        }
        td = tr[i].getElementsByTagName("td")[4];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                found=true;
            }

        }
        td = tr[i].getElementsByTagName("td")[5];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                found=true;
            }

        }
        td = tr[i].getElementsByTagName("td")[6];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                found=true;
            }

        }
        td = tr[i].getElementsByTagName("td")[7];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                found=true;
            }

        }
        td = tr[i].getElementsByTagName("td")[8];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                found=true;
            }

        }
        td = tr[i].getElementsByTagName("td")[9];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                found=true;
            }

        }
        if(found){
            tr[i].style.display = "";
        }else {
            tr[i].style.display = "none";
        }

    }
}