module.exports = function(router, connection){
	router.get('/home', function(req, res) {
        var id = req.params.id;
        connection.query("SELECT * FROM home",  function(err, rows, fields) {
        	if(err){
            var data = {'code' : 401, 'status': 'failure', 'message': 'field error' , 'error':err};
        }else{
            if(rows.length)
                var data = {'code' : 200, 'status': 'success', 'message': 'fetch successful', 'data':rows};
            else
                var data = {'code' : 204, 'status': 'failure', 'message': 'fetch unsuccessful' , 'error':'No data Exists. Try creating one.'};
            }
            res.json(data);
        });
    });

    router.get('/weekly_activity', function(req, res) {
        var id = req.params.id;
        connection.query("SELECT * FROM weekly_activity",  function(err, rows, fields) {
        	if(err){
            var data = {'code' : 401, 'status': 'failure', 'message': 'field error' , 'error':err};
        }else{
            if(rows.length)
                var data = {'code' : 200, 'status': 'success', 'message': 'fetch successful', 'data':rows};
            else
                var data = {'code' : 204, 'status': 'failure', 'message': 'fetch unsuccessful' , 'error':'No data Exists. Try creating one.'};
            }
            res.json(data);
        });
    });

    router.get('/upcoming_activity', function(req, res) {
        var id = req.params.id;
        connection.query("SELECT * FROM upcoming_activity ORDER BY event_date DESC ",  function(err, rows, fields) {
        	if(err){
            var data = {'code' : 401, 'status': 'failure', 'message': 'field error' , 'error':err};
        }else{
            if(rows.length)
                var data = {'code' : 200, 'status': 'success', 'message': 'fetch successful', 'data':rows};
            else
                var data = {'code' : 204, 'status': 'failure', 'message': 'fetch unsuccessful' , 'error':'No data Exists. Try creating one.'};
            }
            res.json(data);
        });
    });

    router.get('/gallery', function(req, res) {
        var id = req.params.id;
        connection.query("SELECT * FROM gallery ",  function(err, rows, fields) {
        	if(err){
            var data = {'code' : 401, 'status': 'failure', 'message': 'field error' , 'error':err};
        }else{
            if(rows.length)
                var data = {'code' : 200, 'status': 'success', 'message': 'fetch successful', 'data':rows};
            else
                var data = {'code' : 204, 'status': 'failure', 'message': 'fetch unsuccessful' , 'error':'No data Exists. Try creating one.'};
            }
            res.json(data);
        });
    });
}