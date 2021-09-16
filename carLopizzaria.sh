
#!/bin/bash
#calls the prompt where app name is
header()
{
clear
echo "welcome to JAY C Pizza"
echo "where the best pizza is made!"
echo " "
echo "-------------------------------------------------"
echo " "
}
#calls prompt where  menu items are 
#we dont wanna keep typing this out 
menu()
{
echo " the is is the menu"
echo " toppings"
printf "1. mushrooms,\n 2. onions,\n 3. peperroni,\n 4. peppers,\n 5. sasuage,\n 6. bacon"
echo " "
echo "Once your finished picking toppings press X"
}
#function that creates the pizza
ordermenu()
{
declare -a yourpizza=() #array where all the chosen topping go into

#start empty beccause because customer hasnt selected any toppings yet

while true 	#loops until customer is finished picking the toppings
do	
	#use numbers as selectors for pizza tppping 
	read -p "pick a topping" toppingresponce
	if (($toppingresponce == 1 ))
	then	#appends the topping to the array(yourpizza)
		yourpizza=("${yourpizza[@]}" "mushroom")
	elif (($toppingresponce == 2 ))
	then
		yourpizza=("${yourpizza[@]}" "onions")
	elif (($toppingresponce == x ))
	then
		echo "finished"
		break
	#customer can press x to break loop once he has all the toppings
	fi
done 
#prints all the toppings in the array
echo ${yourpizza[@]}



}
#this function is used to get the customers address when he picks delivery
delivery()
{
header
echo "we need some more infomation before we can continue"
echo " "
read -p "what is your street address " address
read -p "what is the city " city
read -p "what is the state " state
read -p "what is your zip code " zip
echo " " 
#confirming the address prompt
echo "saving ...."
sleep 1
header
echo "Showing saved address"
echo " "
echo "$address"
echo "$city, $state $zip"
echo " " 
echo "is everything correct?"


}


clear
#animated header for pizza
echo "welcome to Carlo Pizza" 
sleep 1 
echo "where the best pizza is made!"
sleep 1
echo " "
echo "-------------------------------------------------"
echo " "
read -p "what is your name? " name
echo " "
echo "hello $name, we are currently out of cheese"
sleep 2
#loop for user selection
#used to filter out bad input and confirmation
while true
do 
clear
header
echo "what would you like to do "
echo " "
echo "order selection:"
echo "1. Delivery "
echo "2. Carry out"
#user prompt for delivery or carry out 
read -p "pick one of the options above using the numbers " typeoforder
#decision process for ordering 
if (($typeoforder == 1 ))
then
	#choosing delivery
	echo "you chose a delivery!  "
	#confirmation with yes or no
	#yes breaks the loop 
	#no brings you to the beginning 
	read -p "there is a $ 1000 service fee for delivery continue y/n " selection 
	if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
	then 
		#calls the header prompt
		header
		#calls for the delivery prompt
		delivery
 		#break loops once yes is enter
		#moves on to toppings stage
		break
	#choosing no
	#same as before
	elif [ "$selection" == "n" ] || [ "$selection" == "N" ]
	then
		echo "returning to service selection"
		sleep 1 
	else
		echo "wrong selection"
		sleep 1 
	fi
elif (($typeoforder == 2 ))
then 
	#choosing a  carryout
	#same logic process from delivery 
	read -p "you chose a carry-out! is this correct? y/n " selection 
	if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then 

                break
        elif [ "$selection" == "n" ] || [ "$selection" == "N" ]
        then
                echo "returning to service selection"
                sleep 1 
        else
                echo "wrong selection"
                sleep 1 
        fi
else
	echo "wrong selection"
fi
done
echo "lets start your order..."
clear 
header
menu 
ordermenu

