import "./App.css";
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';


import Home from './pages/Home';
import AddSupplier from './pages/AddSupplier';
import Addproduct from './pages/Addproduct';

import Navbar from './Components/Navbar';
import ViewSuppliers from "./pages/ViewAllSupplier";

function App() {
  return (
   <Router>
    <Navbar/>
    <Routes>
    <Route path='/home' element={<Home/>} />
    <Route path='/addsupplier' element={<AddSupplier/>} />
    <Route path='/addproduct' element={<Addproduct/>} />
    <Route path='/viewsuppliers' element={<ViewSuppliers/>} />
    </Routes>
   </Router>

  );
}

export default App;
