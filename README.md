# Inception-42 Repository

Welcome. Inspect the code and resources for the Inception-42 project.

## Usage

### Option 1: GitHub Codespaces

GitHub Codespaces provides a convenient way to work with code in the cloud. If you're new to Codespaces, follow these steps to get started:

1. Click the "Code" button on this GitHub repository's main page.

2. In the dropdown menu, select "Open with Codespaces."

3. Follow the on-screen prompts to create a new Codespace for this repository.

4. Once the Codespace is ready, you can run make and the Docker containers will be created

5. Unfortunately you need to use curl to open the webpage if the clicking on the link (port 443) did not work. Or you can try 2nd option with Virtual Machine below.

```curl -k https://codespace.42.fr```  ->  to open the webpage and skipping the certificate is private warning

```curl http://codespace.42.fr``` -> will give error, as only port 443 and not 80 is set according to subject


### Option 2: Virtual Machine

If you prefer to work with a virtual machine, you can download a ready-to-run Debian virtual machine image from LinuxVMImages which means you don't need to create partitions or setup anything. Here are the steps to set up the virtual machine:

1. Download the Debian or any other Linux virtual machine image from [LinuxVMImages]([https://www.linuxvmimages.com/](https://www.linuxvmimages.com/images/debian-12/)).

2. You just need to click on the .vbox file to run the VM

3. If you get an Error regarding Audio (WAS) then open the .vbox file in Text editor and Remove the line where Audio driver and "WAS" is written

4. If there is an Error regarding USB 2.0, then edit the Settings of the VM in Virtual Box, in the settings USB, just disable USB 2.0
