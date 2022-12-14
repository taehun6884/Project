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
			<td>카테고리</td>
			<td>
				<select name="category">
					<option value="outwear">아우터</option>
					<option value="fulldress">정장</option>
					<option value="Tshirts">티셔츠</option>
					<option value="shirts">셔츠</option>
					<option value="pants">바지</option>
					<option value="shoes">신발</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>상품이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>판매가격</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>색상</td>
			<td><input type="text" name="color"></td>
		</tr>
		<tr>
			<td>수량</td>
			<td><input type="text" name="amount"></td>
		</tr>
		<tr>
			<td>사이즈</td>
			<td><input type="text" name="size"></td>
		</tr>
		<tr>
			<td>제품정보</td>
			<td><input type="text" name="content"></td>
		</tr>
		<tr>
			<td>메인이미지</td>
			<td >
				<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
			</td>
			<td><div id="image_container"></div></td>
		</tr>
		<tr>
			<td>제품이미지1</td>
			<td>
				<input class="form-control form-control-user" type="file" multiple="multiple"
				name="product_detail_image" id="product_detail_image" onchange="setDetailImage(event);">
			</td>
		</tr>
		<tr>
			<td>제품이미지2</td>
			<td><input type="file" name="file3"></td>
		</tr>
		<tr>
			<td>제품이미지3</td>
			<td><input type="file" name="file4"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="상품등록">
			<input type="reset" value="상품등록취소">
		</tr>
	</table>
	</form>
</body>
</html>