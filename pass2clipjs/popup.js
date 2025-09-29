function generatePassword(length, numNonAlphanumeric) {
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    const nonAlphanumeric = "!@#$%^&*()_+-=[]{}|;:,.<>?";
    let password = "";

    for (let i = 0; i < length; i++) {
        if (i < numNonAlphanumeric) {
            password += nonAlphanumeric[Math.floor(Math.random() * nonAlphanumeric.length)];
        } else {
            password += charset[Math.floor(Math.random() * charset.length)];
        }
    }

    return password;
}

function generateAndDisplayPassword() {
    const passwordLengthInput = document.getElementById("password-length");
    const numNonAlphanumericInput = document.getElementById("num-non-alphanumeric");

    const passwordLength = parseInt(passwordLengthInput.value);
    const numNonAlphanumeric = parseInt(numNonAlphanumericInput.value);

    const password = generatePassword(passwordLength, numNonAlphanumeric);
    const passwordDisplay = document.getElementById("password-display");
    passwordDisplay.textContent = "Generated password: " + password;
}

// Add an event listener to the button
const generatePasswordButton = document.getElementById("generate-password-button");
generatePasswordButton.addEventListener("click", generateAndDisplayPassword);

    // New code to handle copy to clipboard
    const generatedPasswordElement = document.getElementById("generated-password");
    const copyPasswordButton = document.getElementById("copy-password-btn");

    copyPasswordButton.addEventListener("click", () => {
      const password = generatedPasswordElement.textContent.replace("Generated password: ", "");
      navigator.clipboard.writeText(password);
      alert("Password copied to clipboard!");
    });
