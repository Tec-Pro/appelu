json.ignore_nil! false
json.(@user,:id,:email,:role)

if @token.present? 
	json.(@token,:token)
end