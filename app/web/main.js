document.getElementById('btn').addEventListener('click', () => {
const ticket = `T-${Math.random().toString(36).slice(2, 8).toUpperCase()}`;
document.getElementById('out').textContent = `Ticket generado: ${ticket}`;
});