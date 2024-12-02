;Write an assembly program to find the sum of all positive values in an array.
;Calculate the sum of all positive numbers in the array.
;Display the sum.
;Display how many  total positive numbers.

include irvine32.inc 
.data
message1 db 'Positive numbrs in array: ',0
message db 'Sum of positive nubers is: ',0
count word 0
array SWORD -10,4,-17,45,23,-33,21,30                      ;Declaration of array

.code 
main proc 
call clrscr
mov eax,0                                                 
 mov esi,OFFSET array
 mov ecx,lengthof array 
 
next:
 test WORD PTR [esi],8000h                               ;Testing the numbers with a negative number having highest bit 1
 pushfd
 add esi,TYPE array
 popfd

jz sum
again:
loop next
jmp display

sum:
inc count
sub esi,TYPE array
add ax,[esi]
add esi,TYPE array
jmp again

display:
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