//
//  ViewController.swift
//  CodeFlight
//
//  Created by user on 3/16/18.
//  Copyright © 2018 MasonD3V. All rights reserved.
//
//func getCurrentDateTime() {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "EEEE, MMMM d"
//    let str = formatter.string(from: Date())
//    navBarDate.setTitle("\(str.uppercased())", for: UIControlState.normal)
//}
//

import UIKit

var tipName = ["Basic HTML Structure", "Common Tags for Blogs", "Text Formatting", "Section Divisions", "Images", "Linking Tags", "Lists", "Tables", "Frames", "Forms", "Miscellaneous Tags", "Body: Background & Colors"]
var tipInfo = ["<html>\n\t<head>\n\t\t<title>website title</title>\n\t</head>\n\t<body>website content</body>\n</html>", "<h?> heading </h?>\n<!-- Heading (h1 for largest to h6 for smallest) -->\n\n<p> paragraph </p>\n<!-- Paragraph of Text -->\n\n<b> bold </b>\n<!-- Make text between tags bold -->\n\n<i> italic </i>\n<!-- Make text between tags italic -->\n\n<a href='url'> link name </a>\n<!-- Create a link to another page or website -->\n\n<div> ... </div>\n<!-- Divide up page content into sections, and applying styles -->\n\n<img src='filename.jpg'>\n<!-- Show an image -->\n\n<ul>\n<li> list </li>\n</ul>\n<!-- Unordered, bullet-point list -->\n\n<br>\n<!-- Line Break (force a new line) -->\n\n<span style='color: red;'> red </span>\n<!-- Use CSS style to change text colour -->", "<h?> ... </h?>\n<!-- Heading (?= 1 for largest to 6 for smallest, eg h1) -->\n\n<b> ... </b>\n<!-- Bold Text -->\n\n<i> ... </i>\n<!-- Italic Text -->\n\n<u> ... </u>\n<!-- Underline Text -->\n\n<strike> ... </strike>\n<!-- Strikeout -->\n\n<sup> ... </sup>\n<!-- Superscript - Smaller text placed below normal text -->\n\n<sub> ... </sub>\n<!-- Subscript - Smaller text placed below normal text -->\n\n<small> ... </small>\n<!-- Small - Fineprint size text -->\n\n<tt> ... </tt>\n<!-- Typewriter Text -->\n\n<pre> ... </pre>\n<!-- Pre-formatted Text -->\n\n<blockquote> ... </blockquote>\n<!-- Text Block Quote -->\n\n<strong> ... </strong>\n<!-- Strong - Shown as Bold in most browsers -->\n\n<em> ... </em>\n<!-- Emphasis - Shown as Italics in most browsers -->\n\n<font> ... </font>\n<!-- Font tag obsolete, use CSS -->", "<div> ... </div>\n<!-- Division or Section of Page Content -->\n\n<span> ... </span>\n<!-- Section of text within other content -->\n\n<p> ... </p>\n<!-- Paragraph of Text -->\n\n<br>\n<!-- Line Break -->\n\n<hr>\n<!-- Basic Horizontal Line -->\n\n<hr>\n<!-- Tag Attributes: -->\n\nsize='?px'\n<!-- Line Thickness in pixels -->\n\nwidth='?px'\n<!-- Line Width in pixels -->\n\nwidth='??%'\n<!-- Line Width as a percentage -->\n\ncolor='#??????'\n<!-- Line Color -->\n\nalign='?'\n<!-- Horizontal Alignment: left, center, right -->\n\nnoshade\n<!-- No 3D cut-out -->\n\n<nobr> ... </nobr>\n<!-- Line Break -->\n\n", "<img src='url' alt='text'>\n<!-- Basic Image -->\n\n<img>\n<!-- Tag Attributes: -->\n\nsrc='url'\n<!-- URL or filename of image (required!) -->\n\nalt='text'\n<!-- Alternate Text (required!) -->\n\nalign='?'\n<!-- Image alignment within surrounding text -->\n\nwidth='??'\n<!--Image width (in pixels or %) -->\n\nheight='??'\n<!-- Image height (in pixels or %) -->\n\nborder='??'\n<!-- Border thickness (in pixels) -->\n\nvspace='??'\n<!-- Space above and below image (in pixels)  -->\n\nhspace='??'\n<!-- Space on either side of image (in pixels) -->", "<a href='url'> link text </a>\n<!-- Basic Link -->\n\n<a>\n<!-- Tag Attributes: -->\n\nhref='url'\n<!-- Location (url) of page to link to. -->\n\nname='??'\n<!-- Name of link (name of anchor, or name of bookmark) -->\n\ntarget='?'\n<!-- Link target location: _self, _blank, _top, _parent -->\n\nhref='url#bookmark'\n<!-- Link to a bookmark (defined with name attribute) -->\n\nhref='mailto:email'\n<!-- Link which initiates an email (dependant on user's email client) -->", "<ol> ... </ol>\n<!-- Ordered List -->\n\n<ul> ... </ul>\n<!-- Un-ordered List -->\n\n<li> ... </li>\n<!-- List Item (within ordered or unordered) -->\n\n<ol type='?'>\n<!-- Ordered list type: A, a, I, i, 1 -->\n\n<ol start='?'>\n<!-- Ordered list starting value -->\n\n<ul type='?'>\n<!-- Unordered list bullet type: disc, circle, square -->\n\n<li value='??'>\n<!-- List Item Value (changes current and subsequent items) -->\n\n<li type='??'>\n<!-- List Item Type (changes only current item) -->\n\n<dl> ... </dl>\n<!-- Definition List -->\n\n<dt> ... </dt>\n<!-- Term or phrase being defined -->\n\n<dd> ... </dd>\n<!-- Detailed Definition of term -->", "<table> ... </table>\n<!-- Define a Table -->\n\n<table>\n<!-- Tag Attributes: -->\n\nborder='?'\n<!-- Thickness of outside border -->\n\nbordercolor='#??????'\n<!-- Border Color -->\n\ncellspacing='?'\n<!-- Space between cells (pixels) -->\n\ncellpadding='?'\n<!-- Space between cell wall and content  -->\n\nalign='??'\n<!-- Horizontal Alignment: left, center, right -->\n\nbgcolor='#??????'\n<!-- Background Color -->\n\nwidth='??'\n<!-- Table Width (pixels or %) -->\n\nheight='??'\n<!-- Table Height (pixels or %) -->\n\n<tr> ... </tr>\n<!-- Table Row within table -->\n\n<th> ... </th>\n<!-- Table Cell within table row -->\n\n<td> ... </td>\n<!-- Number of columns the cell spans across (cell merge) -->\n\n<td>\n<!-- Tag Attributes: -->\n\ncolspan='?'\n<!-- Number of row a cell spans across (cell merge) -->\n\nrowspan='?'\n<!-- Cell Width (pixels or %) -->\n\nwidth='??'\n<!-- Cell Height (pixels or %) -->\n\nheight='??'\n<!-- Cell Height (pixels or %) -->\n\nbgcolor='#??????'\n<!-- Background Color -->\n\nalign='??'\n<!-- Horizontal Alignment: left, center, right -->\n\nvalign='??'\n<!-- Vertical Alignment: top, middle, bottom -->\n\nnowrap\n<!-- Force no line breaks in a particular cell -->", "<frameset> ... </frameset>\n<!-- Define the set of Frames -->\n\n<frameset>\n<!-- Tag Attributes: -->\n\nrows='??,??, ...'\n<!-- Define row sizes & number of rows (size in pixels or %) -->\n\ncols='??,??, ...'\n<!-- Define column sizes & number of columns (size in pixels or %) -->\n\nnoresize='noresize'\n<!-- User cannot resize any frames in frameset -->\n\n<frame> ... </frame>\n<!-- Define a frame within the frameset -->\n\n<frame>\n<!-- Tag Attributes: -->\n\nsrc='url'\n<!-- Location of HTML File for a frame -->\n\nname='***'\n<!-- Unique name of frame window -->\n\nmarginwidth='?'\n<!-- Horizontal margin spacing inside frame (pixels) -->\n\nmarginheight='?'\n<!-- Vertical margin spacing inside frame (pixels) -->\n\nnoresize='noresize'\n<!-- Declare all frameset sizes as fixed -->\n\nscrolling='***'\n<!-- Can the user scroll inside the frame: yes, no, auto -->\n\nframeborder='?'\n<!-- Frame Border: (1=yes, 2=no) -->\n\nbordercolor='#??????'\n<!-- Border Color -->\n\n<noframes> ... </noframes>\n<!-- Unframed content (for browsers not supporting frames) -->", "<form> ... </form>\n<!-- Form input group decleration -->\n\n<form>\n<!-- Tag Attributes: -->\n\naction='url'\n<!-- URL of Form Script -->\n\nmethod='***'\n<!-- Method of Form: get, post -->\n\nenctype='***'\n<!-- For File Upload: enctype='multipart/form-data' -->\n\n<input> ... </input>\n<!-- Input field within form -->\n\n<input>\n <!-- Tag Attributes: -->\n\ntype='***'\n<!-- Input Field Type: text, password, checkbox, submit etc. -->\n\nname='***'\n<!-- Form Field Name (for form processing script) -->\n\nvalue='***'\n<!-- Value of Input Field -->\n\nsize='***'\n<!-- Field Size -->\n\nmaxlength='?'\n<!-- Maximum Length of Input  -->\n\nchecked\n<!-- Field Data -->\n\n<select> ... </select>\n<!-- Select options from drop down list -->\n\n<select>\n<!-- Tag Attributes: -->\n\nname='***'\n<!-- Name (for form processing script) -->\n\nsize='?'\n<!-- Number of selectable options -->\n\nmultiple\n<!-- Allow multiple selections -->\n\n<option> ... </option>\n<!-- Option (item) within drop down list -->\n\n<option>\n<!-- Tag Attributes: -->\n\nvalue='***'\n<!-- Option Value -->\n\nselected\n<!-- Set option as default selected option -->\n\n<textarea> ... </textarea>\n<!-- Large area for text input -->\n\n<textarea>\n<!-- Tag Attributes: -->\n\nname='***'\n<!-- Text Area Name (for form processing script) -->\n\nrows='?'\n<!-- Number of rows of text shown -->\n\ncols='?'\n<!-- Number of columns (characters per rows) -->\n\nwrap='***'\n<!-- Word Wrapping: off, hard, soft -->", "<!-- ... -->\n<!-- Comment within HTML source code -->\n\n<!DOCTYPE html ... >\n<!-- Document Type Definition -->\n\n<meta> ... </meta>\n<!-- META information tag -->\n\n<meta>\n<!-- Tag Attributes: -->\n\nname='***'\n<!-- Meta name: description, keywords, author -->\n\nhttp-equiv='***'\n<!-- HTTP Equivalent Info: title, etc. -->\n\ncontent='***'\n<!-- Information content -->\n\n<link>\n<!-- LINK content relationship tag -->\n\n<link>\n<!-- Tag Attributes: -->\n\nrel='***'\n<!-- Type of forward relationship -->\n\nhttp='url'\n<!-- Location (URL) of object or file being linked -->\n\ntype='***'\n<!-- Type of object or file, eg: text/css -->\n\ntitle='***'\n<!-- Link title (optional) -->", "<body>\n<!-- Tag Attributes: -->\n\nbackground='url'\n<!-- Background Image -->\n\nbgcolor='#??????'\n<!-- Background Color -->\n\ntext='#??????'\n<!-- Document Text Color -->\n\nlink='#??????'\n<!-- Link Color -->\n\nvlink='#??????'\n<!-- Visited Link Color -->\n\nalink='#??????'\n<!-- Active Link Color -->\n\nbgproperties='fixed'\n<!-- Background Properties - ‘Fixed’ = non-scrolling watermark -->\n\nleftmargin='?'\n<!-- Side Margin Size in Pixels (Internet Explorer) -->\n\ntopmargin='?'\n<!-- Top Margin Size in Pixels (Internet Explorer) -->"]
var myIndex = 0

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = nil
        navigationController?.navigationBar.tintColor = nil
        navigationController?.navigationBar.barStyle = UIBarStyle.default
        tabBarController?.tabBar.barTintColor = nil
        tabBarController?.tabBar.tintColor = nil
        tabBarController?.tabBar.barStyle = UIBarStyle.default
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.accessibilityIgnoresInvertColors = false
            tabBarController?.tabBar.accessibilityIgnoresInvertColors = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "html")! as UITableViewCell
        
        let tipNameLabel = cell.viewWithTag(1) as! UILabel
        
        tipNameLabel.text = tipName[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "gotoHTMLTip", sender: self)
    }
    
}
