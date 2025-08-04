import { Link } from "react-router-dom";
import React from "react";

function Home() {
  return (
    <div className="bg-gray-100 min-h-[70vh] p-6">
      <div className="max-w-5xl mx-auto text-center py-10">
        <h1 className="text-4xl font-bold text-sky-950">Bem-vindo ao BluCidadão</h1>
        <p className="text-gray-700 text-lg mt-4">
          Todos os seus serviços públicos municipais em um só lugar.
        </p>
        <div className="mt-6 flex justify-center space-x-4">
          <Link to="/login" className="bg-sky-950 text-white px-6 py-3 rounded-lg hover:bg-sky-950 transition">
            Acessar minha conta
          </Link>
          <Link to="/cadastro" className="bg-white border border-sky-950 text-sky-950 px-6 py-3 rounded-lg hover:bg-blue-100 transition">
            Criar conta
          </Link>
        </div>
      </div>

      <div className="max-w-5xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-6 mt-10">
        <div className="bg-white p-5 rounded shadow">
          <h3 className="text-xl font-bold text-sky-950">Saúde</h3>
          <p className="text-gray-600">Agendamentos, exames e carteira SUS digital.</p>
        </div>
        <div className="bg-white p-5 rounded shadow">
          <h3 className="text-xl font-bold text-sky-950">Educação</h3>
          <p className="text-gray-600">Acompanhe boletins, matrículas e inscrições.</p>
        </div>
        <div className="bg-white p-5 rounded shadow">
          <h3 className="text-xl font-bold text-sky-950">Emprego</h3>
          <p className="text-gray-600">Vagas, cursos gratuitos e feiras de oportunidades.</p>
        </div>
        <div className="bg-white p-5 rounded shadow">
          <h3 className="text-xl font-bold text-sky-950">Transporte</h3>
          <p className="text-gray-600">Horários, recarga do cartão e mapas de linha.</p>
        </div>
      </div>
    </div>
  );
}

export default Home;