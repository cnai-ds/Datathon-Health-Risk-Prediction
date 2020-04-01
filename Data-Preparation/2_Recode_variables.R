Recode_variables0<-function(html_input){ 
 
# Loop through each variable 
sections <- html_input %>% 
  html_nodes('.pagebreak') 
 
description <- data.frame(var_name = numeric(0), 
                          code = numeric(0), 
                          value_description = numeric(0)) 
 
description <- lapply(sections, function(section) { 
  var_name <- section %>% 
    html_node("h3") %>% 
    html_attr('id') 
   
  if(is.na(var_name)) { 
    var_name <- section %>% 
      html_node("h3") %>% 
      html_node("a") %>% 
      html_attr('name') 
  } 
   
  if(var_name != "SEQN") { 
    table <- section %>% 
      html_node("table") 
     
    if(!is.na(table)){ 
      values <- html_table(table) 
      values$var_name = toupper(var_name) # Ensure variable name is always uppercase 
      return(values) 
    } 
  } 
}) 
 
description <- do.call(rbind, description) 
 
return(description) 
} 
 
 
 
 
Recode_variables1 <- function(input_data, input_description) {   
  # Return without changes if there is no information in the codebook 
  if(is.null(input_description)){ 
    return(input_data) 
  } 
   
  for (row in 1:nrow(input_description)){ 
    val <- input_description[row, "Code or Value"] 
    var_name <- input_description[row, "var_name"] 
    descr <- input_description[row, "Value Description"] 
    if(var_name %in% names(input_data) & !is.na(val)){ 
      # Don't attempt re-coding unless the variable is listed in the data and the value is not NA 
      input_data[!is.na(input_data[var_name]) & (input_data[var_name] == val), var_name] <- descr 
    } 
  } 
  return(input_data) 
} 
 
 
 