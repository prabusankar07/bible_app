var moment = require('moment');

module.exports = function(router, connection){

router.post('/create-user', function(req, res) {
    console.log(req.body);
    var token =  Math.floor(Math.random()*1000000);
    console.log(token);
    var post = {
        user_name: req.body.user_name,
        mobile: req.body.mobile,
        mac_address:req.body.mac_address,
        password: req.body.password,
        verification_token: token
    };
    connection.query('INSERT INTO user SET ?', post, function(err, rows, fields) {
    	if(err){
            var data = {'code' : 401, 'status': 'failure', 'message': 'field error' , 'error':err};
        }else{
            var data = {'code' : 200, 'status': 'success', 'message': 'insert successful', 'data':rows};
        }
        res.json(data);
    });
});

router.put('/update-user/:id', function(req, res) {
	var id = req.params.id;
    console.log(req.body);
    var token =  Math.floor(Math.random()*1000000);
    console.log(token);
    var post = {
        user_name: req.body.user_name,
        password: req.body.password
    };
    connection.query('UPDATE user SET ? WHERE id=?', [post, id], function(err, rows, fields) {
    	if(err){
            var data = {'code' : 401, 'status': 'failure', 'message': 'field error' , 'error':err};
        }else{
            if(rows.affectedRows)
                var data = {'code' : 200, 'status': 'success', 'message': 'update successful', 'data':rows};
            else
                var data = {'code' : 204, 'status': 'failure', 'message': 'update unsuccessful' , 'error':'No such record found to update or the requested data is deleted'};
        }
    	res.json(data); 
    });
});

router.get('/user-details/:id', function(req, res) {
        var id = req.params.id;
        console.log("log")
        connection.query("SELECT user_name,mobile FROM user WHERE id = ? ", id, function(err, rows, fields) {
        	if(err){
            var data = {'code' : 401, 'status': 'failure', 'message': 'field error' , 'error':err};
        }else{
            if(rows.length)
                var data = {'code' : 200, 'status': 'success', 'message': 'fetch successful', 'data':rows};
            else
                var data = {'code' : 204, 'status': 'failure', 'message': 'fetch unsuccessful' , 'error':'No data Found or the requested data is deleted'};
            }
            res.json(data);
        });
    });

router.delete('/delete-user/:id', function(req, res) {
        var id = req.params.id;
        connection.query('DELETE FROM user WHERE id=?', id, function(err, rows, fields) {
            if(err){
            var data = {'code' : 401, 'status': 'failure', 'message': 'field error' , 'error':err};
        }else{
            if(rows.affectedRows)
                var data = {'code' : 200, 'status': 'success', 'message': 'delete successful', 'data':rows};
            else
                var data = {'code' : 204, 'status': 'failure', 'message': 'delete unsuccessful' , 'error':'No such record found to update or the requested data is deleted'};
        }
        res.json(data);
        });
    });

router.post('/login', function(req, res) {
        console.log(req.body);
        var mobile = req.body.mobile;
        var password = req.body.password;
        connection.query("SELECT id,user_name,password,status FROM user WHERE mobile = ?", mobile, function(err, rows, fields) {
        	if (err) {
                //console.log(err);
                res.json({'code' : 401, 'status': 'failure', 'message': 'login failed' , 'error':err});
            } else {
            	if (rows.length > 0) {
            		console.log(rows[0].password)
            		if(rows[0].password==password){
	            		res.json({'code' : 200, 'status': 'success', 'message': 'login successful'});
	            	}else res.json({'code' : 200, 'status': 'failure', 'message': 'login unsuccessful password mismatch'})
            	}else res.json({'code' : 204, 'status': 'failure', 'message': 'mobile number not registred'});
            }
        });
	});

}
