@tool

extends Node
class_name NameGenerator

var names_Loaded := preload("res://addons/randomnamesgenerator/names_in_arrays.gd").new()
var rWFemaleFirstNames :Array[String] = names_Loaded.v_RWFemaleFirstNames
var rWMaleFirstNames   :Array[String] = names_Loaded.v_RWMaleFirstNames
var v_RWSurNames       :Array[String] = names_Loaded.v_RWSurNames
var v_Emi1             :Array[String] = names_Loaded.v_Emi1
var v_Emi2             :Array[String] = names_Loaded.v_Emi2
var v_Emi3             :Array[String] = names_Loaded.v_Emi3
var v_Sam1             :Array[String] = names_Loaded.v_Sam1
var v_Sam2             :Array[String] = names_Loaded.v_Sam2
var v_Sam3             :Array[String] = names_Loaded.v_Sam3
var v_Sam5             :Array[String] = names_Loaded.v_Sam5


static func pick_random_element(array1, array2, array3, array4, array5, merge1_2, merge2_3, merge3_4, merge4_5):
	var compiledStrName :String = ""
	var spc1 :String = " "
	var spc2 :String = " "
	var spc3 :String = " "
	var spc4 :String = " "
	if merge1_2 : spc1=""
	if merge2_3 : spc2=""
	if merge3_4 : spc3=""
	if merge4_5 : spc4=""
	#print("Array 3 is empty: ", array3.is_empty() ," testing merge x", spc1,"x")
	randomize()
	if !array5.is_empty():
		compiledStrName = array1[ randi() % array1.size() ] + spc1 + array2[ randi() % array2.size() ] + spc2 + array3[ randi() % array3.size() ] + spc3 + array4[ randi() % array4.size() ] + spc4 + array5[ randi() % array5.size() ]
	elif !array4.is_empty():
		compiledStrName = array1[ randi() % array1.size() ] + spc1 + array2[ randi() % array2.size() ] + spc2 + array3[ randi() % array3.size() ] + spc3 + array4[ randi() % array4.size() ]
	elif !array3.is_empty():
		compiledStrName = array1[ randi() % array1.size() ] + spc1 + array2[ randi() % array2.size() ] + spc2 + array3[ randi() % array3.size() ]
	elif !array2.is_empty():
		compiledStrName = array1[ randi() % array1.size() ] + spc1 + array2[ randi() % array2.size() ]
	return compiledStrName

func new_name():
	var nullArray   :Array[String] = []
	var outputNames :Array[String] = []
	#myArray = names_Loaded.pullArray()             #works to redifine the array to the external files copy of the names in an array.
	#myArray = names_Loaded.v_RWFemaleFirstNames	#this also works; because the variable is exported? No, export not needed.
													#I have not yet figured out how to properly use exported variables.
	#Pack an array with all the output names we have generated. This will be returned to the emitter_Button that called new_name()
	outputNames.push_back( pick_random_element(rWFemaleFirstNames,v_RWSurNames,nullArray,nullArray,nullArray, false, false, false, false) )	#entry[0]: Real World Female Name
		
	outputNames.push_back( pick_random_element(rWMaleFirstNames,v_RWSurNames,nullArray,nullArray,nullArray, false, false, false, false) )	#entry[1]: Real World Male Name
		
	outputNames.push_back( pick_random_element(v_Emi1,v_Emi2,v_Emi3,nullArray,nullArray, true, true, false, false) )	#entry[2]: Emi's Random name generator
	
	outputNames.push_back( pick_random_element(v_Sam1,v_Sam2,v_Sam3,nullArray,nullArray, true, true, false, false) )	#entry[3]: Sam's Random name generator (short)
	
	outputNames.push_back( pick_random_element(v_Sam1,v_Sam2,v_Sam3,v_Sam2,nullArray, true, true, true, false) )	#entry[4]: Sam's Random name generator (Med)
	
	outputNames.push_back( pick_random_element(v_Sam1,v_Sam2,v_Sam3,v_Sam2,v_Sam5, true, true, true, true) )	#entry[5]: Sam's Random name generator (Long)
	
	return outputNames
