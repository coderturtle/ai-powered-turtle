
document.addEventListener("DOMContentLoaded", () => {
  const button = document.createElement("button");
  button.id = "turtle-button";
  button.textContent = "Ask the Turtle 🐢";
  document.body.appendChild(button);

  const panel = document.createElement("div");
  panel.id = "turtle-terminal";
  panel.innerHTML = \`
    <div id="turtle-header">
      <span>🐢 Turtle Prompt Terminal</span>
      <button id="turtle-close">✖</button>
    </div>
    <div id="turtle-content">
      <p><em>Consulting the AI shell...</em></p>
    </div>
  \`;
  document.body.appendChild(panel);

  const close = panel.querySelector("#turtle-close");
  const content = panel.querySelector("#turtle-content");

  button.addEventListener("click", async () => {
    panel.classList.add("open");

    try {
      const res = await fetch("/prompts.json");
      const prompts = await res.json();
      const random = prompts[Math.floor(Math.random() * prompts.length)];

      content.innerHTML = \`
        <h3>\${random.title}</h3>
        <p><strong>Category:</strong> \${random.category}</p>
        <pre>\${random.body}</pre>
        <p class="turtle-quip">💬 "\${getQuip()}"</p>
      \`;
    } catch (err) {
      content.innerHTML = "<p>Error fetching turtle wisdom 🐢</p>";
    }
  });

  close.addEventListener("click", () => {
    panel.classList.remove("open");
  });

  function getQuip() {
    const quips = [
      "You sure you’re ready for this?",
      "Tread softly and carry clean prompts.",
      "This one’s a gem. Or a trap.",
      "Optimized for slowness and wisdom.",
      "The shell speaks only truths."
    ];
    return quips[Math.floor(Math.random() * quips.length)];
  }
});
