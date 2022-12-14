<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
var file = document.querySelector('#getfile');

function setThumbnail(event) {
    for (var image of event.target.files) {
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        document.querySelector("div#image_container").appendChild(img);
      };

      console.log(image);
      reader.readAsDataURL(image);
    }
  }
	
</script>
</head>
<body>
<form action="product_insertPro.po" method="post" name="fr">
	 <table border="1">
		<tr>
			<td>ī�װ�</td>
			<td>
				<select name="category">
					<option value="outwear">�ƿ���</option>
					<option value="fulldress">����</option>
					<option value="Tshirts">Ƽ����</option>
					<option value="shirts">����</option>
					<option value="pants">����</option>
					<option value="shoes">�Ź�</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>��ǰ�̸�</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>�ǸŰ���</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="color"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="amount"></td>
		</tr>
		<tr>
			<td>������</td>
			<td><input type="text" name="size"></td>
		</tr>
		<tr>
			<td>��ǰ����</td>
			<td><input type="text" name="content"></td>
		</tr>
		<tr>
			<td>�����̹���</td>
			<td >
				<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
			</td>
			<td><div id="image_container"></div></td>
		</tr>
		<tr>
			<td>��ǰ�̹���1</td>
			<td>
				<input class="form-control form-control-user" type="file" multiple="multiple"
				name="product_detail_image" id="product_detail_image" onchange="setDetailImage(event);">
			</td>
		</tr>
		<tr>
			<td>��ǰ�̹���2</td>
			<td><input type="file" name="file3"></td>
		</tr>
		<tr>
			<td>��ǰ�̹���3</td>
			<td><input type="file" name="file4"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="��ǰ���">
			<input type="reset" value="��ǰ������">
		</tr>
	</table>
	</form>
</body>
</html>