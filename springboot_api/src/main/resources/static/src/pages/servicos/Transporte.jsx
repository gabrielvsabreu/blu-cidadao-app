function Transporte() {
  return (
    <div className="p-6 max-w-xl mx-auto">
      <h2 className="text-2xl font-bold text-sky-950 mb-4">Consulta de Horários</h2>
      <select className="w-full p-2 border rounded mb-4">
        <option>Linha 101 - Fortaleza</option>
        <option>Linha 404 - Velha</option>
      </select>
      <ul className="text-gray-700">
        <li>06:15</li>
        <li>07:00</li>
        <li>08:45</li>
        <li>10:30</li>
      </ul>
    </div>
  );
}

export default Transporte;
import React from 'react';