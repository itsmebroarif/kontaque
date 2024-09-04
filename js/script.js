document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("contactForm");
  const contactTable = $("#contactTable").DataTable();
  const contactChartCtx = document
    .getElementById("contactChart")
    .getContext("2d");

  let contacts = JSON.parse(localStorage.getItem("contacts")) || [];
  renderContacts();

  form.addEventListener("submit", function (e) {
    e.preventDefault();
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const phone = document.getElementById("phone").value;
    const notes = document.getElementById("notes").value;

    const newContact = { name, email, phone, notes };
    contacts.push(newContact);
    localStorage.setItem("contacts", JSON.stringify(contacts));
    Swal.fire("Success!", "Contact added!", "success");
    renderContacts();
    form.reset();
  });

  function renderContacts() {
    contactTable.clear().draw();
    contacts.forEach((contact, index) => {
      contactTable.row
        .add([
          contact.name,
          contact.email,
          contact.phone,
          contact.notes,
          `<button onclick="deleteContact(${index})" class="btn btn-danger">Delete</button>`,
        ])
        .draw();
    });
    updateChart();
  }

  window.deleteContact = function (index) {
    contacts.splice(index, 1);
    localStorage.setItem("contacts", JSON.stringify(contacts));
    Swal.fire("Deleted!", "Contact has been deleted.", "info");
    renderContacts();
  };

  function updateChart() {
    const emailCounts = contacts
      .map((c) => c.email)
      .reduce((acc, email) => {
        acc[email] = (acc[email] || 0) + 1;
        return acc;
      }, {});
    const phoneCounts = contacts
      .map((c) => c.phone)
      .reduce((acc, phone) => {
        acc[phone] = (acc[phone] || 0) + 1;
        return acc;
      }, {});

    const labels = Object.keys(emailCounts);
    const emailData = labels.map((label) => emailCounts[label]);
    const phoneData = labels.map((label) => phoneCounts[label]);

    new Chart(contactChartCtx, {
      type: "bar",
      data: {
        labels: labels,
        datasets: [
          {
            label: "Emails",
            data: emailData,
            backgroundColor: "rgba(75, 192, 192, 0.2)",
            borderColor: "rgba(75, 192, 192, 1)",
            borderWidth: 1,
          },
          {
            label: "Phones",
            data: phoneData,
            backgroundColor: "rgba(153, 102, 255, 0.2)",
            borderColor: "rgba(153, 102, 255, 1)",
            borderWidth: 1,
          },
        ],
      },
      options: {
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      },
    });
  }
});
