---
layout: document
subtype: normal
title: polarphp 支持语言的语法结构汇总
---

### 基本文法结构

<div class = "grammer-section">
<div class = "grammer-title">源代码字符集语法：</div>

<pre>
<i id = "grammer_unicode_input_character">unicode_input_character:</i>
    <a href = "#grammer_unicode_escape">unicode_escape</a>
    <a href = "#grammer_raw_input_character">raw_input_character</a>

<i id = "grammer_unicode_escape">unicode_escape:</i>
    \u <a href = "#grammer_hex_digit">hex_digit</a> <a href = "#grammer_hex_digit">hex_digit</a> <a href = "#grammer_hex_digit">hex_digit</a> <a href = "#grammer_hex_digit">hex_digit</a>

<i id = "grammer_hex_digit">hex_digit:</i>
    <i>(one of)</i>
    <i>0 1 2 3 4 5 6 7 8 9 a b c d e f A B C D E F</i>

<i id = "grammer_raw_input_character:">raw_input_character:</i>
    <i>any unicode character</i>

<i id = "grammer_unicode_input_character">unicode_input_characters</i>
    <a href = "#grammer_unicode_input_character">unicode_input_character</a> <i>unicode_input_characters</i><sub>opt</sub>

<i id = "grammer_input_character">input_character:</i>
    <i>any unicode character but not CR or LF</i>

<i id = "grammer_input_characters">input_characters:</i>
    <a href = "#grammer_input_character">input_character</a> <i>input_characters</i><sub>opt</sub>

</pre>
    
</div>

<div class = "grammer-section">
<div class = "grammer-title">空白符语法：</div>

<pre>
<i id = "grammer_white_space">white_space</i>
    <a href = "#grammer_white_space_item">white_space_item</a> <i>white_space</i><sub>opt</sub>

<i id = "grammer_line_terminator">line_terminator:</i>
    <i>LF (U+000A)</i>
    <i>CR (U+000D)</i>
    <i>CRLF (U+000D followed by U+000A)</i>

<i id = "grammer_white_space_item">white_space_item:</i>
    <i>NUL (U+0000)</i>
    <i>Horizontal Tabulation  (U+0009)</i>
    <i>Vertical Tabulation  (U+000B)</i>
    <i>Form Feed (U+000C)</i>
    <i>Space (U+0020)</i>
    <a href = "#grammer_line_terminator">line_terminator</a>
</div>

<div class = "grammer-section">
<div class = "grammer-title">注释语法：</div>

<pre>
<i id = "grammer_comment">comment:</i>
    <a href = "#grammer_traditional_comment">traditional_comment</a>
    <a href = "#grammer_end_of_line_comment">end_of_line_comment</a>

<i id = "grammer_traditional_comment">traditional_comment:</i>
    /* <a href = "#grammer_comment_tail">comment_tail</a>

<i id = "grammer_comment_tail">comment_tail:</i>
    * <a href = "#grammer_comment_tail_star">comment_tail_star</a>
    <a href = "#grammer_not_star">not_star</a> <a href = "#grammer_comment_tail">comment_tail</a>

<i id = "grammer_comment_tail_star">comment_tail_star:</i>
    /
    * <a href = "#grammer_comment_tail_star">comment_tail_star</a>
    <a href = "#grammer_not_star_not_slash">not_star_not_slash</a> <a href = "#grammer_comment_tail">comment_tail</a> 

<i id = "grammer_not_star">not_star:</i>
    <a href = "#grammer_input_character">input_character</a> <i>but not *</i>
    <a href = "#grammer_line_terminator">line_terminator</a>

<i id = "grammer_not_star_not_slash">not_star_not_slash:</i>
    <a href = "#grammer_input_character">input_character</a> <i>but not * or /</i>
    <a href = "#grammer_line_terminator">line_terminator</a>

<i id = "grammer_end_of_line_comment">end_of_line_comment:</i>
    // <a href = "#grammer_input_characters">input_characters</a><sub>opt</sub>

</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">源代码基本元素语法：</div>

<pre>
<i id = "grammer_input_element">input_element:</i>
    <a href = "#grammer_white_space">white_space</a>
    <a href = "#grammer_comment">comment</a>
    <a href = "#grammer_token">token</a>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">Token 语法：</div>

<pre>
<i id = "grammer_token">token:</i>
    <a href = "#grammer_identifier">identifier</a>
    <a href = "#grammer_keyword">keyword</a>
    <a href = "#grammer_literal">literal</a>
    <a href = "#grammer_separator">separator</a>
    <a href = "#grammer_operator">operator</a>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">标识符语法：</div>

<pre>
<i id = "grammer_identifier">identifier:</i>
    <a href= "#grammer_typephp_letter">typephp_letter</a> <i>typephp_letter_or_digits</i>
    
<i id = "grammer_typephp_letter_or_digits">typephp_letter_or_digits:</i>
    <a href= "#grammer_typephp_letter_or_digit">typephp_letter_or_digit</a> <i>typephp_letter_or_digits</i><sub>opt</sub>
    
<i id = "grammer_typephp_letter">typephp_letter:</i>
    <i>any unicode character that is a "typephp letter"</i>
    
<i id = "grammer_typephp_letter_or_digit">typephp_letter_or_digit:</i>
    <i>any unicode character that is a "typephp letter_or_digit"</i>

<i id = "grammer_type_identifier">type_identifier:</i>
    <a href = "#grammer_identifier">identifier</a>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">常量语法：</div>

<pre>
<i id = "grammer_literal">literal:</i>
    <a href = "#grammer_integer_literal">integer_literal</a>
    <a href = "#grammer_floating_point_literal">floating_point_literal</a>
    <a href = "#grammer_boolean_literal">boolean_literal</a>
    <a href = "#grammer_character_literal">character_literal</a>
    <a href = "#grammer_string_literal">string_literal</a>
    <a href = "#grammer_null_literal">null_literal</a>
</pre>

</div>
