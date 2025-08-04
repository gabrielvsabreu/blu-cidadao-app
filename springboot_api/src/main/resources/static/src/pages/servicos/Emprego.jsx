function Emprego() {
  return (
    <div className="p-6 max-w-2xl mx-auto">
      <h2 className="text-2xl font-bold text-sky-950 mb-4">Vagas Disponíveis</h2>
      <ul className="space-y-3">
        <li className="p-4 bg-white rounded shadow">
          <strong>Auxiliar Administrativo</strong><br />Empresa: XYZ Ltda<br />
          <button className="mt-2 bg-sky-950 text-white px-4 py-1 rounded">Candidatar-se</button>
        </li>
        <li className="p-4 bg-white rounded shadow">
          <strong>Programador Java Júnior</strong><br />Empresa: TechBlumenau<br />
          <button className="mt-2 bg-sky-950 text-white px-4 py-1 rounded">Candidatar-se</button>
        </li>
      </ul>
    </div>
  );
}

export default Emprego;
import React from 'react';