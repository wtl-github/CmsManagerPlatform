var get = {
		getSelect : function (messige) {
		var typecode = '';
		var level = '';
		if (messige == 1) {
			typecode = $('#one option:selected').val();
			level = '2';
		} else if (messige == 2) {
			typecode = $('#two option:selected').val();
			level = '3';
		}
		var two = $('#two').get(0);
		var three =$('#three').get(0);
		jQuery
				.ajax({
					type : 'POST',
					url : '/fileType/getFiletype.html',
					data : {
						typecode : typecode,
						level : level
					},
					success : function(data) {
						if (data.result == '200') {
							if (messige == 1) {
								three.innerHTML = "";
								var txt = "<option value=''>请选择分类</option>";
								three.innerHTML = txt;
								if(data.detail!=null){
									for (var i = 0; i < data.detail.length; i++) {
										txt += "<option value='"+data.detail[i].typeCode+"'>"
												+ data.detail[i].typeName
												+ "</option>";
									}
								}
								two.innerHTML = txt;
								form.render();
							} else if (messige == 2) {
								var txt = "<option value=''>请选择分类</option>";
								if(data.detail!=null){
									for (var i = 0; i < data.detail.length; i++) {
										txt += "<option value='"+data.detail[i].typeCode+"'>"
												+ data.detail[i].typeName
												+ "</option>";
									}
								}
								three.innerHTML = txt;
								form.render();
							}
						} else {
							console.log(data.description);
						}
					},
					error : function(html) {
						var flag = (typeof console != 'undefined');
						if (flag)
							console.log("服务器忙，提交数据失败，代码:" + html.status
									+ "，请联系管理员!");
						console.log("服务器忙，提交数据失败，请联系管理员!");
					}
				});
	}
}
