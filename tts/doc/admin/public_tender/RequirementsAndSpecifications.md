# Tender announcement

On behalf of the Divvun TTS project

The Norwegian Saami Parliament is announcing an

Open tender

For the acquisition of Speech Synthesis for North Saami

* Enclosure 1: Price form
* Enclosure 2: Standard government agreement forms regarding it-acquisitions
* Enclosure 3: HMS

# Introduction
The Divvun TTS prosject is run by the Saami Parliament in order to produce high-quality speech synthesis for the North Saami languages, one male and one female voice. The produced voices should work on Windows, Linux and MacOS X, using the native speech API's of each operating system.

The Divvun TTS project invites all interested parties to submit tenders for making such speech synthesis for the listed operating systems, based on computational linguistic resources provided by the Divvun TTS project.

The acquisition process will follow the procedure of an open tender, as regulated by the Norwegian law on public procurements and the Norwegian regulations for public procurements part II. The tender has been announced in DOFFIN (ref. XXX) and TED (Tender European Daily), ref. XXX.

# Submission of tender
Tenders can be delivered personally or by mail in a closed envelope marked ”Divvun TTS” to the following address:

Personal delivery or by Mail:
```Sámediggi · Sametinget
Ávjovárgeaidnu 50
N-9730 Kárášjohka/Karasjok
Norway```

Time limit for receipt of tenders:  **1.9.2011 15:00 Norwegian time**

The tender should be delivered at the above address within this time limit. The receiver is not responsible for delayed mail, regardless of reasons. Tenders received after the time-limit will be rejected.

# Instructions to the tenderer
The tenderer should deliver a tender, which is in accordance with the instructions in this document. This is to secure a simple and fair comparison of the received tenders. Incomplete tenders, or tenders containing reservations, errors or unclearities, that can create doubts as to how the tender should be compared to other tenders, will be rejected.

*	The bidder must fill in the enclosed price form. All prices should be quoted in NOK exclusive of VAT. 
*	The bidder should confirm the acceptance of the conditions for the contract as found in the enclosed Standard government agreement forms regarding it-acquisitions. 
*	The tender should be signed by a person with the authority to give a commiting bid.
*	The tender can be written in English, Norwegian or Sámi.

All questions (technical, processual and contractual) concerning the tender process, should be directed to the Norwegian Saami Parliament, NN, xxx@samediggi.no. 

# Qualification criterias
The bidder is obliged to submit tax and VAT certificate, not older than 6 months from the time limit for receipt of tenders, issued by the competent authority to the effect that the tenderer has fulfilled his obligations relating to the payment of taxes, social security contributions and VAT. Tax certificates are issued by the chief municipal treasurer in the municipality where the supplier has their head office and by the tax collector in the equivalent county.

If any work is to be performed in Norway, the tenderer should produce a statement to the effect that he will conform to the Norwegian laws and regulations concerning health, work environment and safety (cf. enclosed HMS-egenerklæring).

## Financial qualifications
The tenderer should have a sound financial and economic standing. This should be documented by the companies latest available balance sheets and a statement of the companies overall turnover and its turnover in respect of the services to which the contract relates for the previous 3 financial years.

## Technical qualifications
It is a prerequisite that the tenderer has a high competence and experience within the subject of this tender. This should be documented with a list of completed assignments including name/telephone number/e-mail of clients who can confirm the delivery. In addition the tenderer must deliver an overview of the formal competence and work experience of the persons who will be involved in the assignment. The tenderer should convincingly document an ability to produce the desired voices with a high quality using the linguistic respurces from the Divvun and Giellatekno groups and the Sámi Parliament. 

 
# Specification of the product to be delivered

## Overview
The goal of the tender part of the Divvun TTS project is to create the following product based on resources developed in cooperation between the selected tenderer and the Divvun and Giellatekno groups:

* North Saami synthetic voices for Windows, MacOS X and Linux (exact versions defined further down). Two voices should be developed, one male and one female voice.
* standard installation packages

The contractor should deliver all parts including installation packages such that end users will only have one installation to do, after which the computer will be able to read text aloud in North Saami.

## Microsoft Windows
The Divvun TTS project is asking for a bid for the making and the integration of North Saami synthetic voices and a full text-to-speech system for Microsoft Windows, based on the existing computational linguistic resources.

The exact list of deliverables for MS Windows is:
#	one set of binary files to provide North Saami synthetic voices using the Speech API as found in MS Windows XP SP2 and newer.
#	installation application to provide end users with a simple and automatized process of correctly installing the binary files listed above. Further details of the installer:
##	The installation package shall be provided in the following languages: English, Norwegian bokmål, Swedish and Finnish. 
##	The instalation package shall be prepared for the addition of North Sámi as an additional language of the installer
    1.  The installer package shall be built using NSIS installer
#	user documentation in English, Norwegian bokmål, Swedish and Finnish.
#	user documentation prepared for translation into North Saami

Possible translation costs of user documentation and installer interface languages should be specified in the tender. The Divvun TTS project will reserve the right to do the translation itself, or in cooperation with the selected company.

## MacOS X

The exact list of deliverables for MacOS X is:
#	one set of binary files to provide North Saami synthetic voices using the Speech API as found in MacOS X 10.4 and newer.
#	installation application to provide end users with a simple and automatized process of correctly installing the binary files listed above. Further details of the installer:
##	The installation package shall be provided in the following languages: English, Norwegian bokmål, Swedish and Finnish. 
    1.  The installer package shall be built using Apple's own installer system
#	user documentation in English, Norwegian bokmål, Swedish and Finnish. 
#	user documentation prepared for translation into North Saami

Possible translation costs of user documentation and installer interface languages should be specified in the tender. The Divvun TTS project will reserve the right to do the translation itself, or in cooperation with the selected company.

# Existing resources

The Divvun TTS project has a set of resources available:
*	trained linguists, a computational linguist and a software engineer
*	large lexicons with proper inflectional class tagging
*   transducers for:
    -   morphological analysis
    -   word-form generation
    -   orthography-to-IPA transciption
*   disambiguator
*   syntactic parser
*   dependency tree parser
*   voice recordings 
*   a corpus built specifically for the recordings
*   a larger corpus with several types of texts (dominated by news and bureaucratic texts, as well as the bible); the corpus for North Saami is about 15 mill. words
*	other resources, such as test beds for linguistic testing, documentation infrastructure, etc.

The tenderers should utilize these resources, and specify how they intend to do so in their application, as well as specify how the work-load will be shared between the Divvun TTS project group and the tenderer, and how the tenderer is envisaging the cooperation. It is obvious that the Divvun TTS project will conduct the linguistic testing of the final products, thus this does not need to be specified.

More detailed descriptions of some of the resources follow below.

## Transducer resources

## Parsing resources

# Speech synthesis technology

The existing TTS-oriented resources are developed in close cooperation with the speech technology group at the Linguistics department, Helsinki university. Based on a number of considerations, we are primarily targeting synthetic voices using a **Hidden Markov Model** (HMM) synthesis. Other synthesis technologies can be considered, depending on price, feasability wrt the existing resources and scaleability for new languages.

# Preprocessor

So far in the TTS project there has been developed preprocessing resources based on the existing transducer technologies being used. The preprocessor is not yet finished, but the text-to-IPA part is quite close. The parts that should handle abbreviations, numbers and other non-textual content is not finished.

We assume that the tenderers will have their own preprocessing tools, and that using their tools will be the easiest and cheapest solution seen from the tenderers' point of view.

There are a couple of downsides to using the preprocessor of the tenderers. It means converting our preprocessor work to another formarlism. It also means relying on closed-source components. Further it moves the TTS preprocessing away from the rest of our text processing infrastructure and technologies.

The alternative solution would be to base the preprocessor on one or both of the following technologies:

* morphological analysis and generation using HFST (http://hfst.sf.net/)
* disambiguation and syntactic analysis using VislCG3 (http://visl.sdu.dk/)

Both technologies are open source, and both are also available in library versions that can easily be integrated into other systems.

The benefits of using existing solutions are tighter integration with the rest of the Divvun & Giellatechno echosystem, better linguistic processing (we know that it works quite well) and less work on the part of the TTS project, ...

What approach to take (tenderer's or Divvun's preprocessor technologies) is an open question, and in the the price form the tenderer should specify the cost of both options.

# Contract regulations
## Terms of payment
The Samediggi will pay a sum equivalent of 15 % of the total contract sum upon signing the contract. A further 35 % will be paid after the beta version is received and accepted. The remaining 50 % will be paid when the end product has been delivered, tested and accepted by the customer.

## Time schedule
An alfa version of the proofing tools, shall be delivered to the customer by 31st October 2006. 

A beta version shall be delivered by 1st February.

Delivery of the final version to Samediggi shall happen within 31st May 2007. Acceptance test shall be excecuted by the customer in the course of one month after the delivery.

## Further regulations
For further information on contract regulations, see enclosed Standard government agreement forms regarding it-acquisitions.

# Licensing issues
## License of the final products
The Saami Parliament will retain full rights to the final products, and is eligible to do whatever it wants with them, including giving them away for free to an unlimited number of end users. The individual copyright holders will retain their copyrights, and a list of copyright holders will be shipped to end users as part of the products, but the copyright holders will not be able to charge for their copyright beyond the one-time payment covered by this project.
The companies are not allowed to resell, bundle or otherwise distribute the final products without prior written consent from the Saami Parliament.

## Escrow
All source code needed to completely rebuild the product must be available through an escrow agreement.

A written proof of an escrow deposit shall be delivered as part of the beta delivery as well as part of the final delivery. The proof shall be in such a form that it suffices to get access to the full source code, should the escrow conditions be met.

The escrow deposit proof must be received by the Divvun TTS project before payment can be done.

# Evaluation of the tenders
## Selection criteria 
The Divvun TTS project will select the economically most advantageous offer, based on the following criteria:

*	Price and total costs
*	Technical compatibility
*	Willingness to license tools to Samediggi and the project group
*	Quality, functionality and user-friendliness
*	Terms and conditions

The selection criteria are not listed according to their order of importance..

## Further information about the selection criterias
### Price and total costs
In evaluating these selection criteria, we will consider the expected total cost over a longer time period, including maintenance cost. 

### Technical compatibility
We will evaluate the technical solution presented by the tenderers and compare it with our existing linguistic resources and language technology. A high degree of compatibility will have a positive influence on total costs. 

### Willingness to license tools to Samediggi
It is important that the tenderer states whether or not it is willing to license the tools to compile the binary lexicon for the proofing tools to Samediggi. It is the wish (but not an absolute demand) of the Samediggi to be able to deliver linguistic, non-technical updates to end-users without the involvement from the cooperating companies. 

### Quality, functionality and user-friendliness
The evaluation of this criterion will be based on the description of the program solution as presented by the tenderer. The tenderer is welcome to support the verbal description with references to, or demonstrations of similar program solutions produced by the tenderer. Under this criterion we will also evaluate the user-friendliness of the solution and the usefulness of any extra functions that might be presented by the tenderer.

### Terms and conditions
The tenderer should as far as possible conform to the terms and conditions described in this tender document, including the enclosed Standard government agreement forms regarding it-acquisitions. Any reservations or deviations must be specified and described sufficiently, allowing us to evaluate the objective cost (whether they be positive or negative). 

# Time frame for maintaining the tender 
Minimum time frame during which the tenderer must maintain its tender is three (3) months from the time limit for receipt of tender.
