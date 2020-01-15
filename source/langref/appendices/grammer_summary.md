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
<div class = "grammer-title">字面量语法：</div>

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
<div class = "grammer-title">整型字面量语法：</div>

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
<div class = "grammer-title">浮点型字面量语法：</div>

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
<div class = "grammer-title">布尔型字面量语法：</div>

<pre>
<i id = "grammer_boolean_literal">boolean_literal:</i>
    <i>(one of)</i>
    true false
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">字符型字面量语法：</div>

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
<div class = "grammer-title">字符串字面量语法：(TODO 未实现 Heredoc 和 Nowdoc)</div>

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
<div class = "grammer-title">空值字面量语法：</div>

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
    <i>transient</i><sub>opt</sub> import <a href = "#grammer_module_name">module_name</a> ;
</pre>

</div>

### 命名空间语法结构

<div class = "grammer-section">
<div class = "grammer-title">命名空间定义语法：</div>

<pre>
<i id = "namespace_definition">namespace_declaration:</i>
    namespace <a href = "#grammer_namespace_name">namespace_name</a> ;
    namespace <a href = "#grammer_namespace_name">namespace_name</a><sub>opt</sub> { <a href = "#grammer_declaration_seq">declaration_seq</a> }
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

<div class = "grammer-section">
<div class = "grammer-title">编译单元语法：</div>

<pre>
<i id = "grammer_translation_unit">translation_unit:</i>
    <a href = "#grammer_top_level_declaration_seq"><i>top_level_declaration_seq</i></a><sub>opt</sub>
    <a href = "#grammer_module_declaration">module-declaration</a> <a href = "#grammer_top_level_declaration_seq"><i>top_level_declaration_seq</i></a><sub>opt</sub>

<i id = "grammer_top_level_declaration_seq">top_level_declaration_seq:</i>
    <a href = "#grammer_top_level_declaration">top_level_declaration</a>
    <a href = "#grammer_top_level_declaration">top_level_declaration</a> <i>top_level_declaration_seq</i>

<i id = "grammer_top_level_declaration">top_level_declaration:</a>
    <a href = "#grammer_module_import_declaration">module_import_declaration</a>
    <a href = "#grammer_namespace_declaration">namespace_declaration</a>
    <a href = "#grammer_namespace_use_declaration">namespace_use_declaration</a>
    <a href = "#grammer_declaration">declaration</a>
</pre>

</div>

### 声明与定义相关语法

<div class = "grammer-section">
<div class = "grammer-title">声明语法：</div>

<pre>
<i id = "grammer_declaration_seq">declaration_seq:</i>
    <a href = "grammer_declaration">declaration</a>
    <a href = "grammer_declaration">declaration</a> <i>declaration_seq</i>

<i id = "grammer_declaration">declaration:</i>
    <a href = "#grammer_export_declaration">export_declaration</a>
    <a href = "#grammer_simple_declaration">simple_declaration</a>
    <a href = "#grammer_typealias_declaration">typealias_declaration</a>
    <a href = "#grammer_enum_declaration">enum_declaration</a>
    <a href = "#grammer_function_declaration">function_declaration</a>
    <a href = "#grammer_trait_declaration">trait_declaration</a>
    <a href = "#grammer_class_declaration">class_declaration</a>
    <a href = "#grammer_interface_declaration">interface_declaration</a>
    <a href = "#grammer_extension_declaration">extension_declaration</a>

<i id = "grammer_export_declaration">export_declaration</i>
    export <a href = "#grammer_declaration">declaration</a>
    export { <a href = "#grammer_declaration_seq"><i>declaration_seq</i></a><sub>opt</sub> }
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">简单变量定义语法：</div>

<pre>
<i id = "grammer_simple_declaration">simple_declaration:</i>
    <a href = "#grammer_annotations">annotations</a><sub>opt</sub> <a href = "#grammer_decl_specifier_seq">decl_specifier_seq</a> <a href = "#grammer_type">type</a> <a href = "#grammer_init_declarator_list"><i>init_declarator_list</i></a><sub>opt</sub> ;

<i id = "grammer_decl_specifier_seq">decl_specifier_seq:</i>
    <a href = "#grammer_decl_specifier">decl_specifier</a>
    <a href = "#grammer_decl_specifier">decl_specifier</a> <i>decl_specifier_seq</i>

<i id = "grammer_decl_specifier">decl_specifier:</i>
    weak
    unowned
    const
    var
    thread_local

<i id = "grammer_init_declarator_list">init_declarator_list:</i>
    <a href = "#grammer_init_declarator">init_declarator</a>
    <a href = "#grammer_init_declarator">init_declarator</a> , <i>init_declarator_list</i>

<i id = "grammer_init_declarator">init_declarator:</i>
    <a href = "#grammer_variable_declarator_id">variable_declarator_id</a> <a href = "#grammer_variable_initializer_clause"><i>variable_initializer_clause</i></a><sub>opt</sub>

<i id = "grammer_variable_declarator_id">variable_declarator_id:</i>
    <a href = "#grammer_identifier">identifier</a> <a href = "#grammer_dimensions">dimensions</a><sub>opt</sub>

<i id = "grammer_variable_initializer_clause">variable_initializer_clause:</i>
    = <a href = "#grammer_variable_initializer">variable_initializer</a>

<i id = "grammer_variable_initializer">variable_initializer:</i>
    <a href = "#grammer_expression">expression</a>
    <a href = "#grammer_array_initializer">array_initializer</a>

<i id = "grammer_array_initializer">array_initializer:</a>
    { <a href = "#grammer_variable_initializer_list">variable_initializer_list</a><sub>opt</sub> ,<sub>opt</sub> }

<i id = "grammer_variable_initializer_list">variable_initializer_list:</i>
    <a href = "#grammer_variable_initializer">variable_initializer</a>
    <a href = "#grammer_variable_initializer">variable_initializer</a> , <i>variable_initializer_list</i><sub>opt</sub>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">类定义语法：</div>

<pre>
<i id = "grammer_class_declaration">class_declaration:</i>
    <a href = "#grammer_class_modifiers"><i>class_modifiers</i></a><sub>opt</sub> class <a href = "#grammer_type_identifier">type_identifier</a> <a href = "#grammer_type_parameters"><i>type_parameters</i></a><sub>opt</sub> <a href = "#grammer_super_class"><i>super_class</i></a><sub>opt</sub> <a href = "#grammer_super_interfaces"><i>super_interfaces</i></a><sub>opt</sub> <a href = "#grammer_class_body">class_body</a>

<i id = "grammer_class_modifiers">class_modifiers:</i>
    <a href = "#grammer_class_modifier">class_modifier</a>
    <a href = "#grammer_class_modifier">class_modifier</a> <i>class_modifiers</i>

<i id = "grammer_class_modifier">class_modifier:</i>
    <a href = "#grammer_annotation">annotation</a> 
    public
    protected 
    private 
    abstract 
    final

<i id = "grammer_super_class">super_class:</i>
    extends <a href = "#grammer_class_type">class_type</a>

<i id = "grammer_super_interfaces">super_interfaces:</i>
    implements <a href = "#grammer_interface_type_list">interface_type_list</a>

<i id = "grammer_interface_type_list">interface_type_list:</a>
    <a href = "#grammer_interface_type">interface_type</a>
    <a href = "#grammer_interface_type">interface_type</a> <i>interface_type_list</i>

<i id = "grammer_class_body">class_body:</i>
    { <a href = "#grammer_ClassBodyDeclaration"><i>class_body_declarations</i></a><sub>opt</sub> }

<i id = "grammer_class_body_declarations">class_body_declarations:</a>
    <a href = "#grammer_class_body_declaration">class_body_declaration</a>
    <a href = "#grammer_class_body_declaration">class_body_declaration</a> <i>class_body_declarations</i>

<i id = "grammer_class_body_declaration">class_body_declaration:</i>
    <a href = "#grammer_class_member_declaration">class_member_declaration</a>
    <a href = "#grammer_constructor_declaration">constructor_declaration</a>
    <a href = "#grammer_destructor_declaration">destructor_declaration</a>

<i id = "grammer_class_member_declaration">class_member_declaration:</i>
    <a href = "#grammer_field_declaration">field_declaration</a>
    <a href = "#grammer_field_declaration">method_declaration</a>
    <a href = "#grammer_class_declaration">class_declaration</a>
    <a href = "#grammer_interface_declaration">interface_declaration</a>
    ;

</pre>
</div>

<div class = "grammer-section">
<div class = "grammer-title">类属性定义语法：</div>

<pre>
<i id = "grammer_field_declaration">field_declaration:</i>
    <a href = "#grammer_field_modifiers"><i>field_modifiers</i></a><sub>opt</sub> <a href = "#grammer_type">type</a> <a href = "#grammer_variable_declarator_list">variable_declarator_list</a> ;

<i id = "grammer_field_modifiers">field_modifiers</i>
    <a href = "#grammer_field_modifier">field_modifier</a>
    <a href = "#grammer_field_modifier">field_modifier</a> <i>field_modifiers</i>

<i id = "grammer_field_modifier">field_modifier:</i>
    <i>(one of)</i>
    <a href = "#grammer_annotation">annotation</a>
    public protected volatile
    private static transient
    const

<i id = "grammer_variable_declarator_list">variable_declarator_list:</i>
    <a href = "#grammer_variable_declarator">variable_declarator</a>
    <a href = "#grammer_variable_declarator">variable_declarator</a> , <i>variable_declarator_list</i>

<i id = "grammer_variable_declarator">variable_declarator:</i>
    <a href = "#grammer_variable_declarator_id">variable_declarator_id</a> <a href = "#grammer_variable_initializer_clause"><i>variable_initializer_clause</i></a><sub>opt</sub>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">类方法定义语法：</div>

<pre>
<i id = "grammer_method_declaration">method_declaration:</i>
    <a href = "#grammer_method_modifiers"><i>method_modifiers</i></a><sub>opt</sub> <a href = "#grammer_method_header">method_header</a> <a href = "#grammer_method_header">method_body</a>

<i id = "grammer_method_modifiers">method_modifiers:</i>
    <a href = "#grammer_method_modifier">method_modifier</a>
    <a href = "#grammer_method_modifier">method_modifier</a> <i>method_modifiers</i>

<i id = "grammer_method_modifier">method_modifier:</i>
    <i>(one of)</i>
    <a href = "#grammer_annotation">annotation</a>
    public protected private
    abstract static final 
    synchronized native

<i id = "grammer_method_header">method_header:</a>
    <a href = "#grammer_annotations"><i>annotations</i></a><sub>opt</sub> <a href = "#grammer_type_parameters"><i>type_parameters</i></a><sub>opt</sub> function <a href = "#grammer_method_declarator">method_declarator</a> <a href = "#grammer_result_type">result_type</a>

<i id = "grammer_method_declarator">method_declarator:</i>
    <a href = "#grammer_identifier">identifier</a> ( <a href = "#grammer_formal_parameter_list"><i>formal_parameter_list</i></a><sub>opt</sub> )

<i id = "grammer_result_type">result_type:</i>
    : <a href = "#grammer_result_type">result_type</a>
    : void

<i id = "grammer_formal_parameter_list">formal_parameter_list:</i>
    <a href = "#grammer_formal_parameter">formal_parameter</a>
    <a href = "#grammer_formal_parameter">formal_parameter</a> , <i>formal_parameter_list</i>

<i id = "grammer_formal_parameter">formal_parameter:</i>
    <a href = "#grammer_variable_modifiers"><i>variable_modifiers</i></a><sub>opt</sub> <a href = "#grammer_type">type</a> <a href = "#grammer_variable_declarator_id">variable_declarator_id</a> 
    <a href = "#grammer_variable_arity_parameter">variable_arity_parameter</a>

<i id = "grammer_variable_modifiers">variable_modifiers:</i>
    <a href = "#grammer_variable_modifier">variable_modifier</a>
    <a href = "#grammer_variable_modifier">variable_modifier</a> <i>variable_modifiers</i>

<i id = "grammer_variable_modifier">variable_modifier:</i>
    <a href = "grammer_annotation">annotation</a>
    const

<i id = "grammer_variable_arity_parameter">variable_arity_parameter:</a>
    <a href = "#grammer_variable_modifiers"><i>variable_modifiers</i></a><sub>opt</sub> <a href = "#grammer_type">type</a> <a href = "grammer_annotations"><i>annotations</i></a><sub>opt</sub> ... <a href = "#grammer_identifier">identifier</a>

<i id = "grammer_method_body">method_body:</i>
    <a href = "#grammer_block">block</a>
    ;
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">类构造方法定义语法：</div>

<pre>
<i id = "grammer_constructor_declaration">constructor_declaration:</i>
    <a href = "#grammer_constructor_modifiers">constructor_modifiers</a><sub>opt</sub> <a href = "#grammer_constructor_declarator">constructor_declarator</a> <a href = "#grammer_constructor_body">constructor_body</a>

<i id = "grammer_constructor_modifiers">constructor_modifiers:</a>
    <a href = "#grammer_constructor_modifier">constructor_modifier</a>
    <a href = "#grammer_constructor_modifier">constructor_modifier</a> <i>constructor_modifiers</i>

<i id = "grammer_constructor_modifier">constructor_modifier:</i>
    <i>(one of)</i>
    <a href = "#grammer_annotation">annotation</a>
    public protected private

<i id = "grammer_constructor_declarator">constructor_declarator:</i>
    <a href = "#grammer_type_parameters"><i>type_parameters</i></a><sub>opt</sub> function __construct ( <a href = "#grammer_formal_parameter_list"><i>formal_parameter_list</i></a><sub>opt</sub> )

<i id = "grammer_constructor_declarator">constructor_body:</i>
    { <a href = "#grammer_explicit_constructor_invocation">explicit_constructor_invocation</a></a><sub>opt</sub> <a href = "#grammer_block_statements"><i>block_statements</i></a><sub>opt</sub> }

<i id = "grammer_explicit_constructor_invocation">explicit_constructor_invocation</i>
    <a href = "#grammer_type_arguments"><i>type_arguments</i></a><sub>opt</sub> self ( <a href = "#grammer_argument_list">argument_list</a><sub>opt</sub> ) ;
    <a href = "#grammer_type_arguments"><i>type_arguments</i></a><sub>opt</sub> parent ( <a href = "#grammer_argument_list">argument_list</a><sub>opt</sub> ) ;

<i href = "grammer_argument_list">argument_list:</i>
    <a href = "#grammer_expression">expression</a>
    <a href = "#grammer_expression">expression</a> , <i>argument_list</i>

</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">类析构方法定义语法：</div>

<pre>
<i id = "grammer_destructor_declaration">destructor_declaration:</i>
    <a href = "#grammer_destructor_modifiers">destructor_modifiers</a><sub>opt</sub> <a href = "#grammer_destructor_declarator">destructor_declarator</a> <a href = "#grammer_method_header">method_body</a>

<i id = "grammer_destructor_declarator">destructor_declarator:</i>
    <a href = "#grammer_type_parameters"><i>type_parameters</i></a><sub>opt</sub> function __destruct ( )

<i id = "grammer_destructor_modifiers">destructor_modifiers:</a>
    <a href = "#grammer_destructor_modifier">destructor_modifier</a>
    <a href = "#grammer_destructor_modifier">destructor_modifier</a> <i>destructor_modifiers</i>

<i id = "grammer_destructor_modifier">destructor_modifier:</i>
    <i>(one of)</i>
    <a href = "#grammer_annotation">annotation</a>
    public protected private
</pre>
</div>

<div class = "grammer-section">
<div class = "grammer-title">接口定义语法：</div>

<pre>
<i id = "grammer_interface_declaration">interface_declaration:</i>
    <a href = "#grammer_interface_modifiers"><i>interface_modifiers</i></a><sub>opt</sub> interface <a href = "#grammer_type_identifier">type_identifier</a> <a href = "#grammer_type_parameters"><i>type_parameters</i></a><sub>opt</sub> <a href = "#grammer_extends_interfaces"><i>extends_interfaces</i></a><sub>opt</sub> <a href = "#grammer_interface_body">interface_body</a>

<i id = "grammer_interface_modifiers">interface_modifiers:</i>
    <a href = "#grammer_interface_modifier">interface_modifier</a>
    <a href = "#grammer_interface_modifier">interface_modifier</a> <i>interface_modifiers</i>

<i id = "grammer_interface_modifier">interface_modifier:</i>
    <i>(one of)</i>
    <a href = "#grammer_annotation">annotation</a>
    public protected private

<i id = "grammer_extends_interfaces">extends_interfaces:</i>
    extends <a href = "#grammer_interface_type_list">interface_type_list</a>

<i id = "grammer_interface_body">interface_body</i>
    { <a href = "#grammer_interface_member_declarations"><i>interface_member_declarations</i></a><sub>opt</sub> }

<i id = "grammer_interface_member_declarations">interface_member_declarations:</i>
    <a href = "interface_member_declaration">interface_member_declaration</a>
    <a href = "interface_member_declaration">interface_member_declaration</a> <i>interface_member_declarations</i>

<i id = "grammer_interface_member_declaration">interface_member_declaration:</i>
    <a href = "#grammer_constant_declaration">constant_declaration</a>
    <a href = "#grammer_interface_method_declaration">interface_method_declaration</a>
    ;

<i id = "grammer_constant_declaration">constant_declaration:</i>
    <a href = "#grammer_constant_modifiers"><i>constant_modifiers</i></a><sub>opt</sub> <a href = "#grammer_type">type</a> <a href = "#grammer_variable_declarator_list">variable_declarator_list</a> ;

<i id = "grammer_constant_modifiers">constant_modifiers</i>
    <a href = "#grammer_constant_modifier">constant_modifier</a>
    <a href = "#grammer_constant_modifier">constant_modifier</a> <i>constant_modifiers</i>

<i id = "grammer_constant_modifier">constant_modifier:</i>
    <i>(one of)</i>
    <a href = "#grammer_annotation">annotation</a>
    public static const

<i id = "grammer_interface_method_declaration">interface_method_declaration</i>
    <a href = "#grammer_interface_method_modifiers"><i>interface_method_modifiers</i></a><sub>opt</sub> <a href = "#grammer_method_header">method_header</a> ;

<i id = "grammer_interface_method_modifiers">interface_method_modifiers:</i>
    <a href = "#grammer_interface_method_modifier">interface_method_modifier</a>
    <a href = "#grammer_interface_method_modifier">interface_method_modifier</a> <i>interface_method_modifiers</i>

<i id = "grammer_interface_method_modifier">interface_method_modifier:</i>
    <i>(one of)</i>
    <a href = "#grammer_annotation">annotation</a>
    public private abstract 
    default static

</pre>

</div>

### 语句相关语法

<div class = "grammer-section">
<div class = "grammer-title">语句块语法：</div>

<pre>
<i id = "grammer_block">block:</i>
    { <a href = "#grammer_block_statements"><i>block_statements</i></a><sub>opt</sub> }

<i id = "grammer_block_statements">block_statements:</i>
    <a href = "#grammer_block_statement">block_statement</a>
    <a href = "#grammer_block_statement">block_statement</a> <i>block_statements</i>

<i id = "grammer_block_statement">block_statement:</i>
    <a href = "#grammer_local_variable_declaration_statement">local_variable_declaration_statement</a>
    <a href = "#grammer_statement">statement</a>

<i id = "grammer_local_variable_declaration_statement">local_variable_declaration_statement:</i>
    <a href = "#grammer_local_variable_declaration">local_variable_declaration</a> ;

<i id = "grammer_local_variable_declaration">local_variable_declaration:</i>
    <a href = "#grammer_variable_modifiers"><i>variable_modifiers</i></a><sub>opt</sub> <a href = "#grammer_local_variable_type">local_variable_type</a> <a href = "#grammer_variable_declarator_list">variable_declarator_list</a>

<i id = "grammer_local_variable_type">local_variable_type:</i>
    <a href = "#grammer_type">type</a>
    var

<i id = "grammer_statement">statement:</i>
    <a href = "#grammer_block">block</a>
    <a href = "#grammer_empty_statement">empty_statement</a>
    <a href = "#grammer_expression_statement">expression_statement</a>
    <a href = "#grammer_assert_statement">assert_statement</a>
    <a href = "#grammer_selection_statement">selection_statement</a>
    <a href = "#grammer_iteration_statement">iteration_statement</a>
    <a href = "#grammer_jump_statement">jump_statement</a>
    <a href = "#grammer_synchronized_statement">synchronized_statement</a>
    <a href = "#grammer_try_statement">try_statement</a>
    <a href = "#grammer_labeled_statement">labeled_statement</a>
    
<i id = "grammer_labeled_statement">labeled_statement:</i>
    <a href = "#grammer_identifier">identifier</a> : <a href = "#grammer_statement">statement</a>

<i id = "grammer_empty_statement">empty_statement:</i>
    ;

<i id = "grammer_synchronized_statement">synchronized_statement:</i>
    synchronized ( <a href = "#grammer_expression">expression</a> ) <a href = "#grammer_block">block</a>

<i id = "grammer_assert_statement">assert_statement:</i>
    assert ( <a href = "#grammer_expression">expression</a> )
    assert ( <a href = "#grammer_expression">expression</a> , <a href = "#grammer_expression">expression</a> )

<i id = "grammer_expression_statement">expression_statement</i>
    <a href = "#grammer_statement_expression">statement_expression</a> ;

<i id = "grammer_statement_expression">statement_expression:</i>
    <a href = "#grammer_assignment_expression">assignment_expression</a>
    <a href = "#grammer_pre_increment_expression">pre_increment_expression</a>
    <a href = "#grammer_pre_decrement_expression">pre_decrement_expression</a>
    <a href = "#grammer_post_increment_expression">post_increment_expression</a>
    <a href = "#grammer_post_decrement_expression">post_decrement_expression</a>
    <a href = "#grammer_method_invocation">method_invocation</a>
    <a href = "#grammer_class_instance_creation_expression">class_instance_creation_expression</a>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">选择语句块语法：</div>

<pre>
<i id = "grammer_selection_statement">selection_statement:</i>
    <a href = "#grammer_if_statement">if_statement</a>
    <a href = "#grammer_switch_statement">switch_statement</a>

<i id = "grammer_if_statement">if_statement:</i>
    <a href = "#grammer_if_statement_without_else">if_statement_without_else</a>
    <a href = "#grammer_if_statement_without_else">if_statement_without_else</a> else <a href = "#grammer_statement">statement</a>

<i id = "grammer_if_statement_without_else">if_statement_without_else:</i>
    if ( <a href = "#grammer_expr">expr</a> ) <a href = "#grammer_statement">statement</a> <a href = "#grammer_elseif_statments"><i>elseif_statments</i></a><sub>opt</sub>

<i id = "grammer_elseif_statments">elseif_statments:</i>
    <a href = "grammer_elseif_statment">elseif_statment</a>
    <a href = "grammer_elseif_statment">elseif_statment</a> <i>elseif_statments</i>

<i id = "grammer_elseif_statment">elseif_statment:</i>
    elseif ( <a href = "#grammer_expr">expr</a> ) <a href = "#grammer_statement">statement</a>

<i id = "grammer_switch_statement">switch_statement:</i>
    switch ( <a id = "#grammer_expression">expression</a> ) <a href = "#grammer_switch_block">switch_block</a>

<i id = "grammer_switch_block">switch_block:</i>
    { <a href = "#grammer_switch_block_statement_groups"><i>switch_block_statement_groups</i></a><sub>opt</sub> <a href = "#grammer_switch_labels"><i>switch_labels</i></a><sub>opt</sub> }

<i id = "grammer_switch_block_statement_groups">switch_block_statement_groups:</i>
    <a href = "grammer_switch_block_statement_group">switch_block_statement_group</a>
    <a href = "grammer_switch_block_statement_group">switch_block_statement_group</a> <i>switch_block_statement_groups</i>

<i id = "grammer_switch_labels">switch_labels:</a>
    <a href = "#grammer_switch_label">switch_label</a>
    <a href = "#grammer_switch_label">switch_label</a> <i>switch_labels</i>

<i id = "grammer_switch_block_statement_group">switch_block_statement_group:</i>
    <a href = "#grammer_switch_labels">switch_labels</a> <a href = "#grammer_block_statements">block_statements</a>

<i id = "grammer_switch_label">switch_label:</a>
    case <a href = "#grammer_expression">expression</a> :
    default :
</pre>
</div>

<div class = "grammer-section">
<div class = "grammer-title">迭代语句块语法：</div>

<pre>
<i id = "grammer_iteration_statement">iteration_statement:</i>
    <a href = "#grammer_do_while_statement">do_while_statement</a>
    <a href = "#grammer_while_statement">while_statement</a>
    <a href = "#grammer_for_statement">for_statement</a>
    <a href = "#grammer_foreach_statement">foreach_statement</a>

<i id = "grammer_do_statement">do_statement</i>
    do <a href = "#grammer_statement">statement</a> while ( <a href = "#grammer_expression">expression</a> ) ;

<i id = "grammer_while_statement">while_statement:</i>
    while ( <a href = "#grammer_expression">expression</a> ) <a href = "#grammer_statement">statement</a>

<i id = "grammer_for_statement">for_statement:</i>
    for ( <a href = "#grammer_for_init"><i>for_init</i></a><sub>opt</sub> ; <a href = "#grammer_statement_expression_list"><i>statement_expression_list</i></a><sub>opt</sub> ; <a href = "#grammer_for_update"><i>for_update</i></a><sub>opt</sub> ) <a href = "#grammer_statement">statement</a>

<i id = "grammer_for_init">for_init:</i>
    <a href = "#grammer_statement_expression_list">statement_expression_list</a>
    <a href = "#grammer_local_variable_declaration">local_variable_declaration</a>

<i id = "grammer_statement_expression_list">statement_expression_list:</i>
    <a href = "#grammer_statement_expression">statement_expression</a>
    <a href = "#grammer_statement_expression">statement_expression</a> <i>statement_expression_list</i>

<i id = "grammer_for_update">for_update:</i>
    <a href = "#grammer_statement_expression_list">statement_expression_list</a>

<i id = "grammer_foreach_statement">foreach_statement:</i>
    foreach ( <a href = "#grammer_expression">expression</a> as <a href = "#grammer_foreach_key"><i>foreach_key</i></a><sub>opt</sub> <a href = "#grammer_foreach_value">foreach_value</a> ) <a href = "#grammer_statement">statement</a>

<i id = "grammer_foreach_key">foreach_key:</i>
    <a href = "#grammer_local_variable_type"><i>local_variable_type</i></a><sub>opt</sub> <a href = "#grammer_identifier">identifier</a> =>

<i id = "grammer_foreach_value">foreach_value:</i>
    <a href = "#grammer_local_variable_type"><i>local_variable_type</i></a><sub>opt</sub> <a href = "#grammer_identifier">identifier</a>
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">跳转语句块语法：</div>
    
<pre>
<i id = "grammer_jump_statement">jump_statement:</i>
    <a href = "#grammer_goto_statement">goto_statement</a>
    <a href = "#grammer_break_statement">break_statement</a>
    <a href = "#grammer_continue_statement">continue_statement</a>
    <a href = "#grammer_return_statement">return_statement</a>
    <a href = "#grammer_throw_statement">throw_statement</a>

<i id = "grammer_goto_statement">goto_statement:</i>
    goto <a href = "#grammer_identifier">identifier</a> ;

<i id = "grammer_break_statement">continue_statement:</i>
    continue <a href = "#grammer_identifier"><i>breakout_level</i></a><sub>opt</sub> ;

<i id = "grammer_continue_statement">break_statement:</i>
    break <a href = "#grammer_identifier"><i>breakout_level</i></a><sub>opt</sub> ;

<i id = "grammer_breakout_level">breakout_level:</i>
    <a href = "#grammer_identifier">identifier</a>
    <a href = "#grammer_integer_literal">integer_literal</a>

<i id = "grammer_return_statement">return_statement:</i>
    return <a href = "#grammer_expression"><i>expression</i></a><sub>opt</sub> ;

<i id = "grammer_throw_statement">throw_statement:</i>
    throw <a href = "#grammer_expression">expression</a> ;
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">异常捕获语法：</div>

<pre>
<i id = "grammer_try_statement">try_statement:</i>
    try <a href = "#grammer_block">block</a> <a href = "#grammer_catche_clauses">catche_clauses</a>
    try <a href = "#grammer_block">block</a> <a href = "#grammer_catche_clauses"><i>catche_clauses</i></a><sub>opt</sub> <a href = "#grammer_finally_clause">finally_clause</a>

<i id = "grammer_catche_clauses">catche_clauses:</i>
    <a href = "#grammer_catche_clause">catche_clause</a>
    <a href = "#grammer_catche_clause">catche_clause</a> <i>catche_clauses</i>

<i id = "grammer_catche_clause">catche_clause:</i>
    catch ( <a href = "#grammer_catch_formal_parameter">catch_formal_parameter</a> ) <a href = "#grammer_block">block</a>

<id id = "grammer_catch_formal_parameter">catch_formal_parameter:</i>
    <a href = "#grammer_variable_modifier">variable_modifier</a> <a href = "#grammer_catch_types">catch_types</a> <a href = "#grammer_variable_declarator_id">variable_declarator_id</a>

<id id = "grammer_catch_types">catch_types:</i>
    <a href = "#grammer_type">type</a>
    <a href = "#grammer_type">type</a> | <i>catch_types</i>

<i id = "#grammer_finally_clause">finally_clause:</i>
    finally <a href = "#grammer_block">block</a>
</pre>

</div>

### 表达式相关语法

<div class = "grammer-section">
<div class = "grammer-title">表达式语法：</div>

<pre>
<i id = "grammer_expression">expression:</i>
    <a href = "#grammer_yield_expression">yield_expression</a>
    print ( <a href = "#grammer_expression">yield_expression</a> )

<i id = "grammer_yield_expression">yield_expression:</i>
    <a href = "#grammer_yield_from_expression">yield_from_expression</a>
    yield
    yield <i>yield_expression</i>
    yield <a href = "#grammer_yield_from_expression">yield_from_expression</a> => <i>yield_expression</i>

<i id = "grammer_yield_from_expression">yield_from_expression:</i>
    <a href = "#grammer_assignment_expression">assignment_expression</a>
    yield from <a href = "#grammer_assignment_expression">assignment_expression</a>

<i id = "grammer_assignment_expression">assignment_expression:</i>
    <a href = "#grammer_conditional_expression">conditional_expression</a>
    <a href = "#grammer_assignment_expression">assignment_expression</a>

<i id = "grammer_assignment">assignment_expression:</i>
    <a href = "#grammer_variable">variable</a> <a href = "#grammer_assignment_operator">assignment_operator</a> <a href = "#grammer_expression">expression</a>

<i id = "grammer_assignment_operator">assignment_operator:</i>
    <i>(one of)</i>
    =  *=  /=  %=  +=  -=  
    <<=  >>=  >>>=  &=  ^=  |=
    **=
</pre>

</div>

<div class = "grammer-section">
<div class = "grammer-title">条件选择表达式语法：</div>

<pre>
<i id = "grammer_conditional_expression">conditional_expression:</i>
    <a href = "#grammer_coalesce_expression">coalesce_expression</a>
    <a href = "#grammer_coalesce_expression">coalesce_expression</a> ? <a href = "#grammer_expression">expression</a><sub>opt</sub> : <i>conditional_expression</i>
</pre>

</div>