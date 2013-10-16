

<?php if ($modules) { ?>
<div id="column-left">

<?php 
// Menu
if ($categories) { ?>
<div id="menu1" style="width: auto;height: auto;">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li style="float:none;"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<?php } ?>

  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</div>
<?php } ?> 
