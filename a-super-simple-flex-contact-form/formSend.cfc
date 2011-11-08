<!--- simon@newtriks.com --->

<cfmail to="simon@newtriks.com" from="#form.email#" subject="Inquiry from Newtriks Website" server="127.0.0.1">

You have received a message from Newtriks Website

Sender's name: #form.name#

Sender's email address: #form.email#

Message:

#form.message#

</cfmail>