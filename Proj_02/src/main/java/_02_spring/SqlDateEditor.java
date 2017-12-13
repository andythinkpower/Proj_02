package _02_spring;

import java.text.DateFormat;
import java.text.ParseException;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;

public class SqlDateEditor extends CustomDateEditor {
	
	private final DateFormat dateFormat;
	private final boolean allowEmpty;
	private final int exactDateLength;
	
	
	public SqlDateEditor(DateFormat dateFormat, boolean allowEmpty) {
		this(dateFormat,allowEmpty,-1);
	}
	
	public SqlDateEditor(DateFormat dateFormat, boolean allowEmpty, int exactDateLength) {
		super(dateFormat, false, exactDateLength);
		this.dateFormat = dateFormat;
		this.allowEmpty=allowEmpty;
		this.exactDateLength = exactDateLength;
		
	}
//

	@Override
	public void setAsText(@Nullable String text) throws IllegalArgumentException {
		if (this.allowEmpty && !StringUtils.hasText(text)) {
			// Treat empty String as null value.
			setValue(null);
		}
		else if (text != null && this.exactDateLength >= 0 && text.length() != this.exactDateLength) {
			throw new IllegalArgumentException(
					"Could not parse date: it is not exactly" + this.exactDateLength + "characters long");
		}
		else {
			try {
				//轉換成java.sql.Date 格式
				setValue(new java.sql.Date(this.dateFormat.parse(text).getTime()));
			}
			catch (ParseException ex) {
				throw new IllegalArgumentException("Could not parse date: " + ex.getMessage(), ex);
			}
		}
	}

	
	
	
	


}
