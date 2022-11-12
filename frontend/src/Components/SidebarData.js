import React from 'react'
import HomeIcon from '@mui/icons-material/Home';
import InventoryIcon from '@mui/icons-material/Inventory';
import BookmarkBorderIcon from '@mui/icons-material/BookmarkBorder';
import PrecisionManufacturingIcon from '@mui/icons-material/PrecisionManufacturing';
import LocalShippingIcon from '@mui/icons-material/LocalShipping';
import PaidIcon from '@mui/icons-material/Paid';
export const  SidebarData =[
    {
        title:"Dashboard",
        icon:<HomeIcon/>,
        path:"/home",
        cName:'nav-text'
    },
    {
        title:"Supplier",
        icon:<InventoryIcon/>,
        path:"/addsupplier",
        cName:'nav-text'
    },
    {
        title:"Orders",
        icon:<BookmarkBorderIcon/>,
        path:"/orderManagement",
        cName:'nav-text'
    },
    {
        title:"Products",
        icon:<PrecisionManufacturingIcon/>,
        path:"/addproduct",
        cName:'nav-text'
    },
    {
        title:"Delivery",
        icon:<LocalShippingIcon />,
        path:"/delivery",
        cName:'nav-text'
    },
    {
        title:"Transactions",
        icon:<PaidIcon />,
        path:"/transaction",
        cName:'nav-text'
    }

  
]
   
