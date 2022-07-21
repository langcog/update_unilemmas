# Unilemmas Policy for Wordbank

## Background
### Context
In [Braginsky et al. (2019)](https://pubmed.ncbi.nlm.nih.gov/31517175/), we wanted to predict when words were acquired across languages, and so we needed to map translation equivalents across languages. We did this in an ad-hoc way, but now we need to do a better job for a larger array of languages. 

### Problem
Languages cut up concepts differently, and different concepts have greater or less importance in different languages - hence children may acquire some concepts early in one language and late in another. For example, “clock” [EN] and “watch” [EN] both are called “reloj” [ES].

## Working definition
Unilemmas are rough cross-linguistic conceptual mappings for words. So, for example, “dog” [EN], “perro” [ES], and “chien” [FR] all seem like they describe the same concept, DOG. DOG is then our unilemma for this concept, allowing mapping between different forms in different languages. 

Our design intention is to provide mappings where they seem reasonable, lumping together many meanings rather than splitting them, so that we can build predictive models of cross-linguistic similarities and differences in acquisition. If we split the conceptual world too finely, we’ll have trouble understanding how similar the information sources are; if we split too coarsely, we can at least discover that languages differ by the differences in predictors. 

One exception to this “lumping” policy is concepts that are prima facie similar, but that play very different cultural roles. For example, although “pan” [ES] and “tortilla” [ES] are relatively similar, they play different cultural roles in Mexican Spanish, and hence we err towards splitting these into separate categories.  

## Specific issues
### Rare concepts
We err towards adding unilemmas for rare concepts, e.g. hippo [CN]. That way, we can make sure that they are included in case other languages go along. We can always filter rare concepts out of our analysis. 

### Pronouns
We switch to a linguistics glossing-style representation to avoid ambiguity. We distinguish person and number, but not formality or case (except for possessives and reflexives, which are sufficiently common cross-linguistically). So, our unilemma set is 1SG, 1PL, 2SG, 2PL, 3SG, 3PL. For possessives, we use .POSS (e.g., 1SG.POSS), and for reflexives, we use .REFL (e.g., 1SG.REFL). We map to what the researcher thinks is the easiest or most default. 

* Ex. “my” and “mine” [EN] will have 1SG.POSS as their lemma. 
* Ex. “me” and “I” [EN] will have 1SG as their unilemma. 
* Ex. “vous” [FR] will have 2PL as its unilemma because (in our judgment) this is the first sense known by children, even though 2SG.formal is also a possible sense. 

Where a language has syncretic forms (i.e. the same form for more than one function, e.g. “you” in English is both 2SG and 2PL), we default to (1) SG rather than PL, (2) smaller person numbers, and (3) the base form rather than POSS (or REFL).

### Words in multiple syntactic categories
We lean towards distinguishing based on meaning rather than on syntax. If two words on a CDI seem to have distinct meanings, we do our best to distinguish these (even if they have the same phonological form). 

* Ex. “clean (action)” and “clean (description)”

### Concepts with very different forms
We’ll generally err towards lumping together different forms that have similar conceptual content. We recognize that this is a “lumper” policy and may lose some conceptual nuance. 

* Ex. “j’ai faim” [FR] and “hungry” [EN] will both have HUNGRY as the unilemma. 

### Ambiguity
Some polysemous items may correspond to multiple concepts that are not captured in a single unilemma (e.g. “饭” [CN] maps to both RICE and FOOD as unilemmas). In these cases, we make a judgment based on the sense that is most likely to be more basic or more common in the child language context, and also with reference to the sense of the unilemmas used in other forms (see e.g. [documentation for Mandarin](https://github.com/langcog/wordbank/pull/211)).

### Language-specific grammatical forms
Items that convey largely grammatical information and are unlikely to be relevant cross-linguistically need not map to a particular unilemma (e.g. classifiers in Mandarin).

### Canonical unilemma form
The canonical form for most unilemmas is singular by default, except for two cases: pluralia tantum (i.e., cases in which there is no singular variant, e.g. ‘jeans’), and small objects that occur in large quantities (e.g., ‘peas’).