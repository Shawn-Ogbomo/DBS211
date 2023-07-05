/**
 * WEB222  Assignment 1
 *
 * I declare that this assignment is my own work in accordance with
 * Seneca Academic Policy. No part of this assignment has been copied
 * manually or electronically from any other source (including web sites)
 * or distributed to other students.
 *
 * Please update the following with your information:
 *
 *      Name: <YOUR_NAME>
 *      Student ID: <YOUR_STUDENT_ID>
 *      Date: <SUBMISSION_DATE>
 *
 * 
 */

/*******************************************************************************
 * 
 * Welcome to Assignment 1! In this assignment, you're going to be practicing lots
 * of new JavaScript programming techniques.  You'll see comments like this one:
 *
 * @param {String} name - the name to greet in the message
 *
 * These are specially formatted comments that define parameters to functions,
 * and tell use the type {String} or {Number}, and also the parameter's name.
 * We also explain a bit about how the parameter is used, and what
 * data it will have, whether it's optional, etc.
 
 *Please complete this js file by writing the code in the specified areas and then submit the assignment on blackboard
 *******************************************************************************
 * Problem 1: remove all spaces and dashes from a String value, and make it lowercase.
 *
 * We want to be able to "crush" a string so that it contains no spaces or dashes,
 * and all letters are lower case.  The crush() function should work like this:
 *
 * crush('ABC') --> returns 'abc' (all lowercase)
 * crush('abc') --> returns 'abc' (the string was already correct, same value)
 * crush('A BC') --> returns 'abc' (lowercase, space removed)
 * crush('a b- c') --> returns 'abc' (lowercase, spaces removed, dash removed)
 *
//  * @param {String} value - a string to be crushed
//  ******************************************************************************/

  function crush(value) 
  {
     // Replace this comment with your code...
      var string2_Cpy = value.replace(/\s+/g, '');
      var string3_Cpy = string2_Cpy.replace(/(-)+/g, '');
      var string4 = string3_Cpy.toLowerCase()

        return string4;
   
 }
  



  
console.log(crush('A BC'));