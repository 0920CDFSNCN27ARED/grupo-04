import CategoryCard from "./CategoryCard/CategoryCard";
import DataCardBig from "./DataCardBig/DataCardBig";
import DataCardSmall from "./DataCardSmall/DataCardSmall";
import ProductTable from "./ProductTable/ProductTable";

function PageContent(){
	
	const smallCardsValue = [
		{
			title: "Products in Data Base",
			value:"135",
			color:"primary",
	 		icon:"fa-clipboard-list"
		},
		{
			title:"Amount in products",
			value:"$546.456",
			color:"success",
			icon:"fa-dollar-sign"
		},
		{
			title:"Users quantity",
			color:"warning",
			value:"38",
			icon:"fa-user-check"
		}
	]

    return(
		<div className="container-fluid">

			<div className="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 className="h3 mb-0 text-gray-800">App Dashboard</h1>
			</div>

			<div className="row">

			{
				smallCardsValue.map((element, i) => {
					return <DataCardSmall key={i} title={element.title} value={element.value}  color={element.color} icon={element.icon}/>
				})
			}
			
			</div>

			<div className="row">
				<DataCardBig/>

				<CategoryCard/>
			</div>

        	<h1 className="h3 mb-2 text-gray-800">All the products in the Database</h1>
			<ProductTable/>
		</div>
    )
}

export default PageContent;