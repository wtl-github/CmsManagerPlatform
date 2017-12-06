var get = {
	getThreeLevelData : function() {
		$.post('/myFile/fileAddInitAjax.html', {}, function(result) {
			var Category = result;
			loadFirstCategory();
			function loadFirstCategory() {
				var firstHtml = '';
				for (var i = 0; i < Category.length; i++) {
					firstHtml += '<option value="' + Category[i].typeCode + '_'
							+ Category[i].mallTwoList.length + '_' + i + '">'
							+ Category[i].typeName + '</option>';
				}
				// 初始化一级数据
				$form.find('select[name=firstCategory]').append(firstHtml);
				form.render();
				form.on('select(firstCategory)', function(data) {
					$form.find('select[name=secondCategory]').html(
							'<option value="">请选择</option>');
					$form.find('select[name=thirdCategory]').html(
							'<option value="">请选择</option>');
					var value = data.value;
					var d = value.split('_');
					var code = d[0];
					var count = d[1];
					var index = d[2];
					if (count > 0) {
						loadSecondCategory(Category[index].mallTwoList);
					} else {
						$form.find('select[name=secondCategory]').parent()
								.empty();
					}
				});
			}
			// 加载二级数据
			function loadSecondCategory(second) {
				var secondHtml = '';
				for (var i = 0; i < second.length; i++) {
					secondHtml += '<option value="' + second[i].typeCode + '_'
							+ second[i].mallThreeList.length + '_' + i + '">'
							+ second[i].typeName + '</option>';
				}
				$form.find('select[name=secondCategory]').append(secondHtml);
				form.render();
				form.on('select(secondCategory)', function(data) {
					var value = data.value;
					var d = value.split('_');
					var code = d[0];
					var count = d[1];
					var index = d[2];
					if (count > 0) {
						loadThirdCategory(second[index].mallThreeList);
					} else {
						$form.find('select[name=thirdCategory]').parent()
								.hide();
					}
				});
			}
			// 加载三级数据
			function loadThirdCategory(third) {
				var thirdHtml = '';
				for (var i = 0; i < third.length; i++) {
					thirdHtml += '<option value="' + third[i].typeCode + '">'
							+ third[i].typeName + '</option>';
				}
				$form.find('select[name=thirdCategory]').html(
						'<option value="">请选择</option>');
				$form.find('select[name=thirdCategory]').append(thirdHtml);
				form.render();
			}
		});
	}
}
