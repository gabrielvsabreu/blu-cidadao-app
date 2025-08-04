import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Servicos from "./pages/Servicos";
import Perfil from "./pages/Perfil";
import Login from "./pages/Login";
import Cadastro from "./pages/Cadastro";
import Dashboard from "./pages/Dashboard";
import Ajuda from "./pages/Ajuda";
import Header from "./components/Header";
import Footer from "./components/Footer";
import Noticias from "./pages/Noticias";

import Saude from "./pages/servicos/Saude";
import Educacao from "./pages/servicos/Educacao";
import Emprego from "./pages/servicos/Emprego";
import Transporte from "./pages/servicos/Transporte";
import Solicitacao from "./pages/servicos/Solicitacao";

import React from "react";

function App() {
  return (
    <Router>
      <div className="flex flex-col min-h-screen">
        <Header />
        <main className="flex-grow">
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/servicos" element={<Servicos />} />
            <Route path="/perfil" element={<Perfil />} />
            <Route path="/login" element={<Login />} />
            <Route path="/cadastro" element={<Cadastro />} />
            <Route path="/dashboard" element={<RotaProtegida><Dashboard /></RotaProtegida>} />
            <Route path="/noticias" element={<Noticias />} />

            <Route path="/ajuda" element={<Ajuda />} />
            <Route path="/servicos/saude" element={<Saude />} />
            <Route path="/servicos/educacao" element={<Educacao />} />
            <Route path="/servicos/emprego" element={<Emprego />} />
            <Route path="/servicos/transporte" element={<Transporte />} />
            <Route path="/servicos/solicitacao" element={<Solicitacao />} />
          </Routes>
        </main>
        <Footer />
      </div>
    </Router>
  );
}

export default App;

import { useAuth } from "./hooks/useAuth";
import { Navigate } from "react-router-dom";

function RotaProtegida({ children }) {
  const { usuario } = useAuth();

  if (!usuario) {
    return <Navigate to="/login" />;
  }

  return children;
}

