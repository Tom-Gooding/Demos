# ATLAS.ti walkthrough for Coding and Qualitative Analysis

**brief introduction**
Atlas.TI has many different features to use for qualitative data analysis. Before you begin your analysis, it’s important to know that not ALL features will be used for your qualitative content analysis. The appropriate use of some features (e.g., calculation of intercoder agreement) require certain guidelines to be followed when building a code system and applying codes to transcripts. 

## Downloading and accessing ATLAS.ti

1. go to [ATLAS.ti.com](https://atlasti.com/)
- click on 'My ATLAS.ti'
- Enter credentials:
  - **username:** United.Study@wsu.edu
  - **Password:** asdfasfasdfs
2. Download ATLAS.ti for Windows or Mac, depending on your device.
- **note:** The Mac and PC versions of ATLAS.ti have the same features but slightly different layouts. This walkthrough was made with the Mac version of ATLAS.ti. The main difference is that Mac users will find the toolbar and options at the top of their screen whereas PC users will find the toolbar and option in their ATLAS.ti program itself (similar to Microsoft Word).

3. Download and install ATLAS.TI 
 - Enter the credentials from step 1. 
 - If/when you get a notification that "no free seats or user licenses..."
   - Go to the web browser where you downloaded ATLAS.ti and **click** "Free up my Seats"
 - We only have one license for the OSMG lab but somehow this works and we've managed to have ~5 different users work in ATLAS.ti this way. 
4. Proceed to log into ATLAS.ti to begin your project. 


## Opening and Starting a Project in ATLAS.ti
![Opening and running ATLAS.ti](ATLAS.ti_pictures/ATLASti_login_screen.png) 
1. Click ‘new project’ to create a new ATLAS.ti project or ‘import project’ to import a previously saved and exported version of an ATLAS.ti project
2. Click the ellipses for additional options. 
- When working on a project, **it is important to upload to cloud periodically** (e.g., at the end of the day). Otherwise, your progress is only saved locally on your desktop and won’t be accessible to others. 
- ‘Duplicate’ allows you to create a clone of a project at that exact point in time. I use duplicate project when working with others to allow each person their own version of the project (which will be merged together once all coding is completed). 
  - Creating a duplicate project is not a necessary step but I prefer to do this to create one additional layer of protection against an individual messing up the progress someone else has made (which is likely to happen when multiple individuals are working on the same project). 

## Opening Page of a Project.

![Home page of a project](ATLAS.ti_pictures/ATLASti_opened_project.png)

- **Left margin** = shortcuts to all items in this project (i.e., documents uploaded, codes created, memos, networks, etc.). 

-  **Important!!!** When opening up a project, __immediately verify that the *current* user__ is yourself (e.g., Tom Gooding). 
   -  Switch to your username, if needed. When you log in under a different user and proceed to work on a project, any progress you make is made under their name and not yours. This is the #1 way a project gets messed up. You will make a bunch of progress only to find that you were working under your colleagues name and not yours. This results in you having to re-code everything under your own name and will disrupt whatever progress your colleague was making that the same time. IF you were both working on the project simultaneously, this will likely cause someone’s progress to be overwritten once you save to the cloud. Always verify upon log in that you are under the correct username.
   
**How to create and switch between users.** 

![Navigating User management](ATLAS.ti_pictures/ATLASti_user_management.png)

1. On the toolbar at the top of your screen (For Windows users this is a tab in ATLAS.TI itself):
2. Project --> user management --> show user manager.
3. Identify the appropriate username (current username being used will be in bold). 
4. Create a new user (+), if needed. You will be prompted to provide a username and password. I think the password is optional but have used ‘sleep’ as a generic password when creating usernames for research assistants. 
5. **Note:** The ‘change user’ option under user management doesn’t always accept username + passwords to toggle between usernames. Hence, I just use the show user manager window to change back and forth. 

## Setting up a Team Project. 
- **This is a very important section if you will be co-coding with other individuals on a project**

**Project Flow.**



## Starting a Project.
- **If this is your first time using ATLAS.ti,** I highly recommend reading through the ATLAS.ti user manual for either Mac or Windows, depending on your device. Specifically, the sections about creating quotations and applying codes to create a code book. A majority of this information will be covered below but those sections are critical for qualitative content analysis and the ATLAS.ti user manuals have step-by-step images and commentary that is pretty easy to follow. 
 
- Additionally, check out the ATLAS.ti YouTube channel for additional video walkthroughs.
  - [Here](https://www.youtube.com/watch?v=ym8PaAym9js) is a link for a Youtube video walkthrough of working with quotations.
  - [Here](https://www.youtube.com/watch?v=4CVkB90mrsY) is a YouTube video walkthrough of code categories and sub-codes. 

**Preparing and importing documents into ATLAS.TI for code analysis.**

- Documents to import for qualitative analysis will likely be transcripts from focus groups or interviews with study participants that were recorded in Zoom. The automatically transcribed transcripts are recorded in .txt or .vtt formats.
  - For cleaning transcript documents prior to importing these into ATLAS.ti:
    - Find the appropriate file in WSU Zoom Cloud recordings (I use the .vtt filetype but others are viable).
    - Find a website that can convert .vtt to microsoft word filetype (.docx). I use [Ebby.co](https://ebby.co/subtitle-tools/converter/vtt-to-docx)
    - Upload the .vtt file and select .docx as the "convert to" option and download the word document. 

A ‘raw’ transcript file in a .docx format will be very long as any pause in the audio recording will cause the transcribed conversation to begin a new line of text. **To reduce the length and to manually clean the transcript data,** use the following steps:

1.	Highlight the entire transcript document in yellow (yellow = to be cleaned). 
2.	Place each speaker’s name in bold to easily identify who is speaking. 
3.	Condense the consecutive lines of text that belong to the same speaker (TG may be speaking for 15 lines resulting in 15 lines that all indicate ‘TG’ is speaking). 
a.	I place each speaker’s name in bold to easily identify who is speaking.
b.	I condense the lines of text so that the speaker is only identified once until a new speaker is detected in the text.
4.	Using timestamps from the WSU Zoom video chat/text box (in Zoom itself, not the transcript) identify the timestamps for each question/prompt and add these to the transcripts themselves highlighted and in bold (this helps with knowing what part of the conversation you’re in when there are 30+ pages of textual data to code). 
a.	For any part of the transcribed dialogue that is unclear, find the appropriate moment in the Zoom video/audio recording and identify what the text transcription was supposed to be. Make the necessary correction. 
i.	If a speaker is using abbreviations or mentions something unclear, place a comment in brackets [ ] to provide context and highlight the bracketed information so that coders know that wasn’t part of the dialogue. (e.g., “afib [atrial fibrillation] can be a life threatening cardiac emergency.”
