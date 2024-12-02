;Description: Write an assembly program to find the sum of all odd values in an array.
;Calculate the sum of all odd numbers in the array.
;Display the sum.
;Display how many total odd numbers.


include irvine32.inc 
.data
message1 db 'total odd numbers:  ',0
message db 'Sum of odd values is:  ',0
array WORD 1,3,5,7,9,31,6,4,10                      ;Declaration of array
count word 0

.code 
main proc 
call clrscr
mov eax,0
 mov esi,OFFSET array                               ;moving offset of array in esi
 mov ecx,lengthof array                             ;initializing ECX
 
next: 
 test WORD PTR [esi],1h                             ;Testing values with 0000 0000 0000 0001
 pushfd                                             ;pushing registers for saving their states
 add esi,TYPE array                                 ;moving to next index of array
 popfd 
 jnz sum                                            ;if zero flag is not ON Jump to SUM label
 again:                                             ;After sum back to loop
 loop next
jmp display                                         ;For directly moving to display
 
sum:
inc count                                           ;To count number of odd numbers in array
sub esi,TYPE array                                  ;To move back to previous index as in loop we moved to next element
add ax,[esi]                                        ;Adding value in a register which is zero at initial state
add esi,TYPE array                                  ;Again moving to next index after adding values
jmp again

display:                                            ;To display the results
mov edx, OFFSET message
call writestring
call writedec
call crlf
mov edx, OFFSET message1
call writestring
mov eax,0
mov ax,count
call writedec



 exit 
main endp 
end main



