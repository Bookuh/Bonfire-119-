# Question 1 
# Write a function to print "hello_USERNAME!" USERNAME is the input of the function.
def hello_name(user_name):
    print(f"hello_{user_name}")

name = input("Please enter your name.")
hello_name(name)


print("\n")

# Question 2 
# Write a python function, first_odds that prints the odd numbers from 1-100 and returns nothing
def first_odds():
   for num in list(range(1,101,2)):
      print(num)
first_odds()


print("\n")

# Question 3
# Please write a Python function, max_num_in_list to return the max number of a given list.
def max_num_in_list(a_list):
   a_list.sort()
   print(a_list.pop())
max_num = [47, 89, 26, 38, 524, 78, 109, 20, 1]
max_num_in_list(max_num)


print("\n")

# Question 4
# Write a function to return if the given year is a leap year. A leap year is divisible by 4, but not divisible by 100, unless it is also divisible by 400.
# The return should be boolean Type (true/false).
def is_leap_year(a_year):
   if a_year % 4 == 0:
      if a_year % 100 == 0:
         if a_year % 400 == 0:
            return True
      elif a_year % 4 == 0:
         if a_year % 100 != 0:
            if a_year % 400!= 0:
               return True
      elif a_year % 4 == 0:
         if a_year % 100 == 0:
            if a_year % 400 != 0:
               return False
   else:
      return False
           
year = 2000
print(is_leap_year(year))

print("\n")

# Question 5
# Write a function to check to see if all numbers in list are consecutive numbers.
def is_consecutive(a_list):
   for num in range(len(a_list)-1):
      if a_list[num] > a_list[num + 1]:
          return False 
   else:
      return True 

my_list = [7,8,9,10,11,12]
print(is_consecutive(my_list))   