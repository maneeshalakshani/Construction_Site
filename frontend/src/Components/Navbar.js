import React, { useState } from 'react'
import * as FaIcons from "react-icons/fa";
import {Link} from 'react-router-dom';
import {SidebarData} from './SidebarData';


function Navbar() {
    const [sidebar,setSidebar]= useState(false);
    const showSidebar = ()=> setSidebar(!sidebar);

  return (
    <div>
      <div className='navbar'>
        <Link to="#" className='menubars'>
           <FaIcons.FaBars></FaIcons.FaBars>
        </Link>
      </div>
      <nav className={sidebar ? 'nav-menu active': 'nav-menu'}>
        <ul className='nav-menu-items'>
            <li className='navbar-toggle'>
                <Link to='#' className='menu-bars'></Link>
            </li>
            {SidebarData.map((item, index)=>{ 
                return( 
                    <li key={index} className={item.cName}>
                        <Link to={item.path}>
                            {item.icon}
                            <span>{item.title}</span>
                        </Link>
                    </ li>
                );
            })}
        </ul>
        
      </nav>
     
    </div>
  )
}

export default Navbar
