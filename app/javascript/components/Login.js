import React from 'react'

function Login( {authenticity_token, endpoint="/users"}) {
    return (
        <div>
            <form id = "new_user" class = "new_user" action={`${endpoint}/sign_in`} accept-charset='UTF-8' method="post">
                <input type='hidden' name='authenticity_token' value={authenticity_token} />
                <div className='login-field'>
                    <label for="user_email">Email</label>
                    <input id="user_email" autofocus="autofocus" type="email" name="user[email]"/>
                </div>
                <div className='login-field'>
                    <label for="user_password">Password</label>
                    <input id="user_password" type="password" name="user[password]"/>
                </div>
                <div class="actions">
                    <input type="submit" name="commit" value="Log in" data-disable-with="Log in"/>
                </div>
            </form>
        </div>
    )
}

export default Login
