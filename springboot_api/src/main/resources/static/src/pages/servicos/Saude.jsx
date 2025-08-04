import { useState } from "react";

function Saude() {
  const [especialidade, setEspecialidade] = useState("");
  const [data, setData] = useState("");
  const [hora, setHora] = useState("");
  const [agendamentos, setAgendamentos] = useState(
    JSON.parse(localStorage.getItem("agendamentos")) || []
  );
  const [mensagem, setMensagem] = useState("");

  function agendarConsulta(e) {
    e.preventDefault();
    if (!especialidade || !data || !hora) {
      setMensagem("Preencha todos os campos!");
      return;
    }
    const novo = { especialidade, data, hora };
    const novosAgendamentos = [...agendamentos, novo];
    setAgendamentos(novosAgendamentos);
    localStorage.setItem("agendamentos", JSON.stringify(novosAgendamentos));
    setMensagem("Consulta agendada com sucesso!");
    setEspecialidade("");
    setData("");
    setHora("");
  }

  return (
    <div className="p-6 max-w-xl mx-auto">
      <h2 className="text-2xl font-bold text-sky-950 mb-4">Agendamento de Consulta</h2>
      <form className="space-y-4" onSubmit={agendarConsulta}>
        <input
          type="text"
          placeholder="Especialidade"
          className="w-full p-2 border rounded"
          value={especialidade}
          onChange={(e) => setEspecialidade(e.target.value)}
        />
        <input
          type="date"
          className="w-full p-2 border rounded"
          value={data}
          onChange={(e) => setData(e.target.value)}
        />
        <input
          type="time"
          className="w-full p-2 border rounded"
          value={hora}
          onChange={(e) => setHora(e.target.value)}
        />
        <button className="w-full bg-sky-950 text-white p-2 rounded">Agendar</button>
        {mensagem && <div className="text-green-600 text-sm">{mensagem}</div>}
      </form>
      <div className="mt-8">
        <h3 className="text-lg font-semibold text-sky-950 mb-2">Consultas Agendadas</h3>
        {agendamentos.length === 0 && (
          <div className="text-gray-500">Nenhuma consulta agendada.</div>
        )}
        <ul className="space-y-2">
          {agendamentos.map((a, i) => (
            <li key={i} className="bg-white rounded shadow p-2 flex justify-between">
              <span>
                <strong>{a.especialidade}</strong> - {a.data} às {a.hora}
              </span>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}

export default Saude;