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

<i id = "grammer_raw_input_character:">raw_input_character:</i>
    <i>any unicode character</i>

<i id = "grammer_unicode_input_character">unicode_input_characters</i>
    <a href = "#grammer_unicode_input_character">unicode_input_character</a>
    <a href = "#grammer_unicode_input_character">unicode_input_character</a> <i>unicode_input_characters</i>

<i id = "grammer_input_character">input_character:</i>
    <i>any unicode character but not CR or LF</i>

<i id = "grammer_input_characters">input_characters:</i>
    <a href = "#grammer_input_character">input_character</a>
    <a href = "#grammer_input_character">input_character</a> <i>input_characters</i>

</pre>
    
</div>

<div class = "grammer-section">
<div class = "grammer-title">空白符语法：</div>

<pre>
<i id = "grammer_white_space">white_space</i>
    <a href = "#grammer_white_space_item">white_space_item</a>
    <a href = "#grammer_white_space_item">white_space_item</a> <i>white_space</i>

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
    // <a href = "#grammer_input_characters"><i>input_characters</i></a><sub>opt</sub>

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
    <a href = "#grammer_punctuator">punctuator</a>
    <a href = "#grammer_operator">operator</a>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">关键字语法：</div>

<pre>
<i id = "grammer_keyword">keyword:</i>
    <i>(one of)</i>
    abstract   and   array   as   break
    callable   case   catch   class   clone
    const   continue   declare   default   die
    do   echo   else   elseif   empty
    enddeclare   exit   extends   final   finally
    for   foreach   function   global   goto
    if   implements   instanceof   insteadof   interface
    list   namespace   new   or   thread_local
    private   protected   public   return   static
    switch   throw   trait   try   use
    var   while   xor   yield   yield from
    throws   import   module   fallthrough   synchronized
    volatile   void   transient   self   parent
    let   export   assert
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">标点符号(punctuator)语法：</div>

<pre>
<i id = "grammer_punctuator">punctuator:</i>
    <i>(one of)</i>
    [   ]   (   )   {   }   ,   .   ...   @   ::
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">运算符(operator)语法：</div>

<pre>
<i id = "grammer_operator">operator:</i>
    <i>(one of)</i>
    =   >   <   !   ~   ?   :   ->
    ==   >=   &lt;=    !=    &&    ||   ++   --   ===   !==
    +   -   *   /   &   |   ^   %   <<   >>   ??
    +=   -=   *=   /=   &=   |=   ^=   %=   &lt;&lt;=   >>=
    **   **=   <=>
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

<div class = "grammer-section">
<div class = "grammer-title">整型常量语法：</div>

<pre>
<i id = "grammer_integer_literal">integer_literal:</i>
    <a href = "#grammer_decimal_integer_literal">decimal_integer_literal</a>
    <a href = "#grammer_hex_integer_literal">hex_integer_literal</a>
    <a href = "#grammer_octal_integer_literal">octal_integer_literal</a>
    <a href = "#grammer_binary_integer_literal">binary_integer_literal</a>

<i id = "grammer_decimal_integer_literal">decimal_integer_literal:</i>
    <a href = "#grammer_decimal_numeral">decimal_numeral</a> <a id = "#grammer_integer_type_suffix"><i>integer_type_suffix</i></a><sub>opt</sub>

<i id = "grammer_hex_integer_literal">hex_integer_literal:</i>
    <a href = "#grammer_hex_number">hex_numeral</a> <a id = "#grammer_integer_type_suffix"><i>integer_type_suffix</i></a><sub>opt</sub>

<i id = "grammer_octal_integer_literal">octal_integer_literal:</i>
    <a href = "#grammer_octal_numeral">octal_numeral</a> <a id = "#grammer_integer_type_suffix"><i>integer_type_suffix</i></a><sub>opt</sub>

<i id = "grammer_binary_integer_literal">binary_integer_literal:</i>
    <a href = "#grammer_binary_numeral">binary_numeral </a> <a id = "#grammer_integer_type_suffix"><i>integer_type_suffix</i></a><sub>opt</sub>

<i id = "grammer_integer_type_suffix">integer_type_suffix:</i>
    <i>(one of)</i>
    l L

<i id = "grammer_decimal_numeral">decimal_numeral:</i>
    0
    <a href = "#grammer_non_zero_digit">non_zero_digit</a> <a href = "#grammer_digits"><i>digits</i></a><sub>opt</sub>
    <a href = "#grammer_non_zero_digit">non_zero_digit</a> <a href = "#grammer_underscores">underscores</a> <a href = "#grammer_digits">digits</a>

<i id = "grammer_non_zero_digit">non_zero_digit:</i>
    <i>(one of)</i>
    1 2 3 4 5 6 7 8 9

<i id = "grammer_digits:">digits:</i>
    <a href = "#grammer_digit">digit</a>
    <a href = "#grammer_digit">digit</a> <a href = "#grammer_digits_and_underscores"><i>digits_and_underscores</i></a><sub>opt</sub> <a href = "#grammer_digit">digit</a>

<i id = "grammer_digit">digit:</i>
    0
    <a href = "#grammer_non_zero_digit">non_zero_digit</a>

<i id = "grammer_digits_and_underscores">digits_and_underscores:</i>
    <a href = "#grammer_digit_or_underscore">digit_or_underscore</a>
    <a href = "#grammer_digit_or_underscore">digit_or_underscore</a> <i>digits_and_underscores</i>

<i id = "grammer_digit_or_underscore">digit_or_underscore:</i>
    <a href = "#grammer_digit">digit</a>
    _

<i id = "grammer_underscores">underscores:</i>
    _ <i>underscores</i><sub>opt</sub>

<i id = "grammer_hex_numeral">hex_numeral:</i>
    0 x <a href = "#grammer_hex_digits">hex_digits</a>
    0 X <a href = "#grammer_hex_digits">hex_digits</a>

<i id = "grammer_hex_digits">hex_digits:</i>
    <a href = "#grammer_hex_digit">hex_digit</a>
    <a href = "#grammer_hex_digit">hex_digit</a> <a href = "#grammer_hex_digits_and_underscores"><i>hex_digits_and_underscores</i></a><sub>opt</sub> <a href = "#grammer_hex_digit">hex_digit</a>

<i id = "grammer_hex_digit">hex_digit:</i>
    <i>(one of)</i>
    0 1 2 3 4 5 6 7 8 9 a b c d e f A B C D E F

<i id = "grammer_hex_digits_and_underscores">hex_digits_and_underscores:</i>
    <a href = "#grammer_hex_digit_or_underscore">hex_digit_or_underscore</a>
    <a href = "#grammer_hex_digit_or_underscore">hex_digit_or_underscore</a> <i>hex_digits_and_underscores</i>

<i id = "grammer_hex_digit_or_underscore">hex_digit_or_underscore:</i>
    <a href = "#grammer_hex_digit">hex_digit</a>
    _

<i id = "grammer_octal_numeral">octal_numeral:</i>
    0 <a href = "#grammer_octal_digits">octal_digits</a>
    0 <a href = "#grammer_underscores">underscores</a> <a href = "#grammer_octal_digits">octal_digits</a>

<i id = "grammer_octal_digits">octal_digits:</i>
    <a href = "#grammer_octal_digit">octal_digit</a>
    <a href = "#grammer_octal_digit">octal_digit</a> <a href = "#grammer_octal_digits_and_underscores"><i>octal_digits_and_underscores</i></a><sub>opt</sub> <a href = "#grammer_octal_digit">octal_digit</a>

<i id = "grammer_octal_digit">octal_digit:</i>
    <i>(one of)</i>
    0 1 2 3 4 5 6 7

<i id = "grammer_octal_digits_and_underscores">octal_digits_and_underscores:</i>
    <a href = "#grammer_octal_digit_or_underscore">octal_digit_or_underscore</a>
    <a href = "#grammer_octal_digit_or_underscore">octal_digit_or_underscore</a> <i>octal_digits_and_underscores</i>

<i id = "grammer_octal_digit_or_underscore">octal_digit_or_underscore:</i>
    <a href = "#grammer_octal_digit">octal_digit</a>
    _

<i id = "grammer_binary_numeral">binary_numeral:</i>
    0 b <a href = "#grammer_binary_digits">binary_digits</a>
    0 B <a href = "#grammer_binary_digits">binary_digits</a>

<i id = "grammer_binary_digits">binary_digits:</i>
    <a href = "#grammer_binary_digit">binary_digit</a>
    <a href = "#grammer_binary_digit">binary_digit</a> <a href = "#grammer_binary_digits_and_underscores"><i>binary_digits_and_underscores</i></a><sub>opt</sub> <a href = "#grammer_binary_digit">binary_digit</a>

<i id = "grammer_binary_digit">binary_digit:</i>
    <i>(one of)</i>
    0 1

<i id = "grammer_binary_digits_and_underscores">binary_digits_and_underscores:</i>
    <a href = "#grammer_binary_digit_or_underscore">binary_digit_or_underscore</a>
    <a href = "#grammer_binary_digit_or_underscore">binary_digit_or_underscore</a> <i>binary_digits_and_underscores</i>

<i id = "grammer_binary_digit_or_underscore">binary_digit_or_underscore:</i>
    <a href = "#grammer_binary_digit">binary_digit</a>
    _
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">浮点型常量语法：</div>

<pre>
<i id = "grammer_floating_point_literal">floating_point_literal:</i>
    <a href = "#grammer_decimal_floating_point_literal">decimal_floating_point_literal</a>
    <a href = "#grammer_hexadecimal_floating_point_literal">hexadecimal_floating_point_literal</a>

<i id = "grammer_decimal_floating_point_literal">decimal_floating_point_literal:</i>
    <a href = "#grammer_digits">digits</a> . <a href = "#grammer_digits"><i>digits</i></a><sub>opt</sub> <a href = "#grammer_exponent_part"><i>exponent_part</i></a><sub>opt</sub> <a href = "#grammer_float_type_suffix"><i>float_type_suffix</i></a><sub>opt</sub>
    . <a href = "#grammer_digits">digits</a> <a href = "#grammer_exponent_part"><i>exponent_part</i></a><sub>opt</sub> <a href = "#grammer_float_type_suffix"><i>float_type_suffix</i></a><sub>opt</sub>
    <a href = "#grammer_digits">digits</a> <a href = "#grammer_exponent_part">exponent_part</a> <a href = "#grammer_float_type_suffix"><i>float_type_suffix</i></a><sub>opt</sub>
    <a href = "#grammer_digits">digits</a> <a href = "#grammer_exponent_part"><i>exponent_part</i></a><sub>opt</sub> <a href = "#grammer_float_type_suffix">float_type_suffix</a>

<i id = "grammer_exponent_part">exponent_part:</i>
    <a href = "#grammer_exponent_indicator">exponent_indicator</a> <a href = "#grammer_signed_integer">signed_integer</a>

<i id = "grammer_exponent_indicator">exponent_indicator:</i>
    <i>(one of)</i>
    e E

<i id = "grammer_signed_integer">signed_integer:</i>
    <a href = "#grammer_sign"><i>sgin</i></a><sub>opt</sub> <a href = "#grammer_digits">digits</a>

<i id = "grammer_sign">sgin:</i>
    <i>(one of)</i>
    + -

<i id = "grammer_float_type_suffix">float_type_suffix:</i>
    <i>(one of)</i>
    f F d D

<i id = "grammer_hexadecimal_floating_point_literal">hexadecimal_floating_point_literal:</i>
    <a href = "#grammer_hex_significand">hex_significand</a> <a href = "#grammer_binary_exponent">binary_exponent</a> <a href = "#grammer_float_type_suffix"><i>float_type_suffix</i></a><sub>opt</sub>

<i id = "grammer_hex_significand">hex_significand:</i>
    <a href = "#grammer_hex_numeral"><i>hex_numeral</i></a> .<sub>opt</sub>
    0 x <a href = "#grammer_hex_digits"><i>hex_digits</i></a><sub>opt</sub> . <a href = "#grammer_hex_digits">hex_digits</a> 
    0 X <a href = "#grammer_hex_digits"><i>hex_digits</i></a><sub>opt</sub> . <a href = "#grammer_hex_digits">hex_digits</a>

<i id = "grammer_binary_exponent">binary_exponent:</i>
    <a href = "#grammer_binary_exponent_indicator">binary_exponent_indicator</a> <a href = "#grammer_signed_integer">signed_integer</a>

<i id = "grammer_binary_exponent_indicator">binary_exponent_indicator:</i>
    <i>(one of)</i>
    p P
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">布尔型常量语法：</div>

<pre>
<i id = "grammer_boolean_literal">boolean_literal:</i>
    <i>(one of)</i>
    true false
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">字符型常量语法：</div>

<pre>
<i id = "grammer_character_literal">character_literal:</i>
    ' <a href = "#grammer_single_character">single_character</a> ' 
    ' <a href = "#grammer_escape_sequence">escape_sequence</a> '

<i id = "grammer_single_character">single_character:</i>
    <a href = "#grammer_input_character">input_character</a> but not ' or \

<i id = "grammer_escape_sequence">escape_sequence:</i>
    \ b (Backspace U+0008)
    \ t (Horizontal Tabulation U+0009)
    \ n (New Line U+000A)
    \ f (Form Feed U+000C)
    \ r (Carriage Return U+000D)
    \ " (Quotation Mark U+0022)
    \ ' (Apostrophe U+0027)
    \ \ (Reverse Solidus U+005C)
    <a href = "#grammer_octal_escape">octal_escape</a> (U+0000 ~ U+00FF)

<i id = "grammer_octal_escape">octal_escape:</i>
    \ <a href = "#grammer_octal_digit">octal_digit</a>
    \ <a href = "#grammer_octal_digit">octal_digit</a> <a href = "#grammer_octal_digit">octal_digit</a>
    \ <a href = "#grammer_zero_to_three">zero_to_three</a> <a href = "#grammer_octal_digit">octal_digit</a> <a href = "#grammer_octal_digit">octal_digit</a>

<i id = "grammer_octal_escape">zero_to_three:</i>
    <i>(one of)</i>
    0 1 2 3

</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">字符串型常量语法：(TODO 未实现 Heredoc 和 Nowdoc)</div>

<pre>
<i id = "grammer_string_literal">string_literal:</i>
    <a href = "#grammer_single_quote_string">single_quote_string</a>
    <a href = "#grammer_double_quote_string">double_quote_string</a>

<i id = "grammer_single_quote_string">single_quote_string:</i>
    <a href = "#grammer_b_prefix"><i>b_prefix</i></a><sub>opt</sub> ' <a href = "#grammer_string_characters"><i>string_characters</i></a><sub>opt</sub> '

<i id = "grammer_double_quote_string">double_quote_string:</i>
    <a href = "#grammer_b_prefix"><i>b_prefix</i></a><sub>opt</sub> &quot; <a href = "#grammer_string_characters"><i>string_characters</i></a><sub>opt</sub> &quot;

<i id = "grammer_b_prefix">b_prefix:</i>
    <i>(one of)</i>
    b B

<i id = "grammer_string_characters">string_characters:</i>
    <a href = "#grammer_string_character">string_character</a>
    <a href = "#grammer_string_character">string_character</a> <i>string_characters</i>

<i id = "grammer_string_character">string_character:</i>
    <a href = "#grammer_input_character">input_character</a> but not &quot; or \
    <a href = "#grammer_escape_sequence">escape_sequence</a>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">空值常量语法：</div>

<pre>
<i id = "grammer_null_literal">null_literal:</i>
    <i>null</i>
</pre>

</div>

### 类型语法结构

<div class = "grammer-section">
<div class = "grammer-title">类型语法：</div>

<pre>
<i id = "grammer_type">type:</i>
    <a href = "#grammer_fundamental_type">fundamental_type</a>
    <a href = "#grammer_extended_reference_type">extended_reference_type</a>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">基础类型语法：</div>

<pre>
<i id = "grammer_fundamental_type">fundamental_type:</i>
    <a href = "#grammer_annotations">annotations</a><sub>opt</sub> <a href = "#grammer_numeric_type">numeric_type</a>
    <a href = "#grammer_annotations">annotations</a><sub>opt</sub> Boolean

<i id = "grammer_numeric_type">numeric_type:</i>
    <a href = "#grammer_integral_type">integral_type</a>
    <a href = "#grammer_floating_point_type">floating_point_type</a>

<i id = "grammer_integral_type">integral_type:</i>
    <i>(one of)</i>
    Byte Short Integer Long Char

<i id = "grammer_floating_point_type">floating_point_type:</i>
    <i>(one of)</i>
    Float Double
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">扩展引用类型语法：</div>

<pre>
<i id = "grammer_extended_reference_type">extended_reference_type:</i>
    <a href = "#grammer_class_or_interface_type">class_or_interface_type</a>
    <a href = "#grammer_type_variable">type_variable</a>
    <a href = "#grammer_array_type">array_type</a>
    <a href = "#grammer_annotation_type">annotation_type</a>

<i id = "grammer_class_or_interface_type">class_or_interface_type:</i>
    <a href = "#grammer_class_type">class_type</a>
    <a href = "#grammer_interface_type">interface_type</a>

<i id = "grammer_class_type">class_type:</i>
    <a href = "#grammer_class_type_item">class_type_item</a>
    <a href = "#grammer_namespace_name">namespace_name</a> \ <a href = "#grammer_class_type_item">class_type_item</a>

<i id = "grammer_class_type_item">class_type_item:</i>
    <a href = "#grammer_annotations"><i>annotations</i></a><sub>opt</sub> <a href = "#grammer_type_identifier">type_identifier</a> <a href = "#grammer_type_arguments"><i>type_arguments</i></a><sub>opt</sub>
    <a href = "#grammer_annotations"><i>annotations</i></a><sub>opt</sub> <a href = "#grammer_type_identifier">type_identifier</a> <a href = "#grammer_type_arguments"><i>type_arguments</i></a><sub>opt</sub> :: <i>class_type_item</i>

<i id = "grammer_interface_type">interface_type:</i>
    <a href = "#grammer_class_type">class_type</a>

<i id = "grammer_annotation">annotation_type:</i>
    <a href = "#grammer_class_type">class_type</a>

<i id = "grammer_type_variable">type_variable:</i>
    <a href = "#grammer_annotations"><i>annotations</i></a><sub>opt</sub> <a href = "#grammer_type_identifier">type_identifier</a>

<i id = "grammer_array_type">array_type:</i>
    <a href = "#grammer_fundamental_type">fundamental_type</a> <a href = "#grammer_dimensions">dimensions</a>
    <a href = "#grammer_class_or_interface_or_annotation_type">class_or_interface_or_annotation_type</a> <a href = "#grammer_dimensions">dimensions</a>
    <a href = "#grammer_type_variable">type_variable</a> <a href = "#grammer_dimensions">dimensions</a>

<i id = "grammer_dimensions">dimensions:</i>
    <a href = "#grammer_dimension">dimension</a>
    <a href = "#grammer_dimension">dimension</a> <i>dimensions</i>

<i id = "grammer_dimension">dimension:</i>
    <a href = "#grammer_annotations"><i>annotations</i></a><sub>opt</sub> [ ]
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">（泛型）类型形参语法：</div>

<pre>

<i id = "grammer_type_parameters">type_parameters:</i>
    &lt; <a href = "#grammer_type_parameter_list">type_parameter_list</a> >

<i id = "grammer_type_parameter_list">type_parameter_list:</i>
    <a href = "#grammer_type_parameter">type_parameter</a>
    <a href = "#grammer_type_parameter">type_parameter</a> , <i>type_parameter_list</i>

<i id = "grammer_type_parameter">type_parameter:</i>
    <a href = "#grammer_type_parameter_modifier"><i>type_parameter_modifier</i></a><sub>opt</sub> <a href = "#grammer_type_identifier">type_identifier</a> <a href = "#grammer_type_bound"><i>type_bound</i></a><sub>opt</sub>

<i id = "grammer_type_parameter_modifier">type_parameter_modifier:</i>
    <a href = "#grammer_type_parameter_modifier_item">type_parameter_modifier_item</a>
    <a href = "#grammer_type_parameter_modifier_item">type_parameter_modifier_item</a> <i>type_parameter_modifier</i>

<i id = "grammer_type_parameter_modifier_item">type_parameter_modifier_item:</i>
    <a href = "#grammer_annotation">annotation</a>

<i id = "grammer_type_bound">type_bound:</i>
    extends <a href = "#grammer_type_variable">TypeVariable</a>
    extends <a href = "#grammer_class_or_interface_type">class_or_interface_type</a> <a href = "#grammer_additional_bounds"><i>additional_bounds</i></a>

<i id = "grammer_additional_bounds">additional_bounds:</i>
    <a href = "#grammer_additional_bound">additional_bound</a>
    <a href = "#grammer_additional_bound">additional_bound</a> <i>additional_bounds</i>

<i id = "grammer_additional_bound">additional_bound:</i>
    & <a href = "#grammer_interface_type">interface_type</a>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">（泛型）类型实参语法：</div>

<pre>
<i id = "grammer_type_arguments">type_arguments:</i>
    &lt; <a href = "#grammer_type_argument_list">type_argument_list</a> >

<i id = "grammer_type_argument_list">type_argument_list:</i>
    <a href = "#grammer_type_argument">type_argument</a>
    <a href = "#grammer_type_argument">type_argument</a> , <i>type_argument_list</i>

<i id = "grammer_type_argument">type_argument:</i>
    <a href = "#grammer_extended_reference_type">extended_reference_type</a>
    <a href = "#grammer_wildcard">wildcard</a>

<i id = "grammer_wildcard">wildcard:</i>
    <a href = "#grammer_annotations"><i>annotations</i></a><sub>opt</sub> ? <a href = "#grammer_wildcard_bounds"><i>wildcard_bounds</i></a><sub>opt</sub>

<i id = "#grammer_wildcard_bounds">wildcard_bounds:</i>
    extends <a href = "#grammer_extended_reference_type">extended_reference_type</a>
    super <a href = "#grammer_extended_reference_type">extended_reference_type</a>

</pre>

</div>

### 程序实体命名语法结构
<div class = "grammer-section">
<div class = "grammer-title">名称相关语法：</div>

<pre>
<i id = "grammer_module_name">module_name:</i>
    <a href = "#grammer_identifier">identifier</a>
    <a href = "#grammer_identifier">identifier</a> . <i>module_name</i>

<i id = "grammer_namespace_name">namespace_name:</i>
    <a href = "#grammer_identifier">identifier</a>
    <a href = "#grammer_identifier">identifier</a> \ <i>namespace_name</i>

<i id = "grammer_type_name">type_name:</i>
    <a href = "#grammer_type_name_ns_part">type_name_ns_part</a>
    namespace \ <a href = "#grammer_type_name_item">type_name_ns_part</a>
    \ <a href = "#grammer_type_name_item">type_name_ns_part</a>

<i id = "grammer_type_name_ns_part">type_name_ns_part:</i>
   <a href = "#grammer_type_name_item">type_name_item</a>
   <a href = "#grammer_namespace_name">namespace_name</a> \ <a href = "#grammer_type_name_item">type_name_item</a>

<i id = "grammer_type_name_item">type_name_item:</i>
    <a href = "#grammer_type_identifier">type_identifier</a>
    <a href = "#grammer_type_identifier">type_identifier</a> :: <i>type_name_item</i>
    
</pre>

</div>

### 模块语法结构

<div class = "grammer-section">
<div class = "grammer-title">模块相关语法：</div>

<pre>
<i id = "module_declaration">module_declaration:</i>
    <i>export</i><sub>opt</sub> <a href = "#grammer_annotations">annotations</a><sub>opt</sub> module <a href = "#grammer_module_name">module_name</a> ;

<i id = "grammer_module_import_declaration">module_import_declaration:</i>
    <i>export</i><sub>opt</sub> import <a href = "#grammer_module_name">module_name</a> ;
</pre>

</div>

### 命名空间语法结构

<div class = "grammer-section">
<div class = "grammer-title">命名空间定义语法：</div>

<pre>
<i id = "namespace_definition">namespace_definition:</i>
    namespace <a href = "#grammer_namespace_name">namespace_name</a> ;
    namespace <a href = "#grammer_namespace_name">namespace_name</a><sub>opt</sub> <a href = "#grammer_top_stmt_codeblock">top_stmt_codeblock</a>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">命名空间引入语法：</div>

<pre>
<i id = "grammer_namespace_use_declaration">namespace_use_declaration:</i>
    use <a href = "#grammer_mixed_group_use_declaration">mixed_group_use_declaration</a> ;
    use <a href = "#grammer_use_type">use_type</a> <a href = "#grammer_group_use_declaration">group_use_declaration</a> ;
    use <a href = "#grammer_use_type"><i>use_type</i></a><sub>opt</sub> <a href = "#grammer_use_declarations">use_declarations</a> ;

<i id = "grammer_use_type">use_type:</i>
    <i>(one of)</i>
    const
    function

<i id = "grammer_group_use_declaration">group_use_declaration:</i>
    \<sub>opt</sub> <a href = "#grammer_namespace_name">namespace_name</a> \ { <a href = "#grammer_inline_use_declarations">unprefixed_use_declarations</a> ,<sub>opt</sub> }

<i id = "grammer_mixed_group_use_declaration">mixed_group_use_declaration:</i>
    \<sub>opt</sub> <a href = "#grammer_namespace_name">namespace_name</a> \ { <a href = "#grammer_inline_use_declarations">inline_use_declarations</a> ,<sub>opt</sub> }

<i id = "grammer_inline_use_declarations">inline_use_declarations:</i>
    <a href = "#grammer_inline_use_declaration">inline_use_declaration</a>
    <a href = "#grammer_inline_use_declaration">inline_use_declaration</a> <i>inline_use_declarations</i>

<i id = "grammer_unprefixed_use_declarations">unprefixed_use_declarations:</i>
    <a href = "#grammer_unprefixed_use_declaration">unprefixed_use_declaration</a>
    <a href = "#grammer_unprefixed_use_declaration">unprefixed_use_declaration</a> <i>unprefixed_use_declarations</i>

<i id = "grammer_use_declarations">use_declarations:</i>
    <a href = "#grammer_use_declaration">use_declaration</a>
    <a href = "#grammer_use_declaration">use_declaration</a> <i>use_declarations</i>

<i id = "grammer_inline_use_declaration">inline_use_declaration:</i>
    <a href = "#grammer_unprefixed_use_declaration">unprefixed_use_declaration</a>
    <a href = "#grammer_use_type">use_type</a> <a href = "#grammer_unprefixed_use_declaration">unprefixed_use_declaration</a>

<i id = "grammer_unprefixed_use_declaration">unprefixed_use_declaration:</i>
    <a href = "#grammer_namespace_name">namespace_name</a>
    <a href = "#grammer_namespace_name">namespace_name</a> as <a href = "#grammer_identifier">identifier</a>

<i id = "grammer_use_declaration">use_declaration:</i>
    \<sub>opt</sub> <a href = "#grammer_unprefixed_use_declaration">unprefixed_use_declaration</a>

</pre>

</div>

### 编译单元语法结构