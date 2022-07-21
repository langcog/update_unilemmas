# Unilemma Updating Project 2022

This repository contains data and code for the project aiming to update unilemmas (rough cross-linguistic conceptual mappings) for [Wordbank](http://wordbank.stanford.edu/). 
This project had several aims:
* Codify a unilemma policy, which details a working definition and method for unilemmas;
* Standardize the canonical form of unilemmas;
* Gather knowledge from native or advanced proficient speakers for as many languages as possible; and
* Improve unilemma coverage overall.

## Method
The Wordbank team first collaboratively detailed a [unilemma policy](), which helped to make design decisions for unilemmas explicit. 

We then sent this policy document to native or advanced proficient speakers helping to verify and correct our form definitions for all 38 languages in Wordbank. 
These speakers proposed corrections and additions for unilemmas, and left additional notes where they were helpful.

Subsequently, members of the Wordbank team (@kachergis and @alvinwmtan) went through the unilemmas, merging unconflicting suggestions, and manually deciding conflicts; this was conducted using the `update_unilemmas.R` script, as well as individual scripts for each language. 
We also standardized the canonical form for many unilemmas, and propagated the changes throughout relevant forms.
Finally, we changed all pronoun unilemmas to their new form based on linguistics glossing using the `update_pronouns.R` script.

The final instrument definitions can be found in the `final_instruments_pro` folder. 
