import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    bool value = false;
    final theme = ShadTheme.of(context);


    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          Center(
              child: Text('Profile', style: ShadTheme
                  .of(context)
                  .textTheme
                  .h1Large,)
          ),
          ShadAccordion<({String content, String title})>(
            children: details.map(
                  (detail) =>
                  ShadAccordionItem(
                    value: detail,
                    title: Text(detail.title),
                    child: Text(detail.content),
                  ),
            ),
          ),
          ShadAlert(
            icon: Icon(LucideIcons.terminal),
            title: Text('Heads up!'),
            description:
            Text('You can add components to your app using the cli.'),
          ),
          ShadAlert.destructive(
            icon: Icon(LucideIcons.circleAlert),
            title: Text('Error'),
            description:
            Text('Your session has expired. Please log in again.'),
          ),
          ShadAvatar(
            'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
            placeholder: Text('CN'),
          ),
          ShadBadge(
            child: const Text('Primary'),
          ),
          ShadBadge.secondary(
            child: const Text('Secondary'),
          ),
          ShadBadge.destructive(
            child: const Text('Destructive'),
          ),
          ShadBadge.outline(
            child: const Text('Outline'),
          ),
          ShadBreadcrumb(
            children: [
              ShadBreadcrumbLink(
                onPressed: () => print('Navigating to Home'),
                child: const Text('Home'),
              ),
              ShadBreadcrumbDropdown(
                items: [
                  ShadBreadcrumbDropMenuItem(
                    onPressed: () => print('Navigating to Documentation'),
                    child: const Text('Documentation'),
                  ),
                  ShadBreadcrumbDropMenuItem(
                    onPressed: () => print('Navigating to Themes'),
                    child: const Text('Themes'),
                  ),
                  ShadBreadcrumbDropMenuItem(
                    onPressed: () => print('Navigating to Github'),
                    child: const Text('Github'),
                  ),
                ],
                showDropdownArrow: false,
                child: ShadBreadcrumbEllipsis(),
              ),
              Text('Components'),
              Text('Breadcrumb'),
            ],
          ),
          ShadCalendar(
            captionLayout: ShadCalendarCaptionLayout.dropdownMonths,
            selected: today,
            fromMonth: DateTime(today.year - 1),
            toMonth: DateTime(today.year, 12),
          ),
          ShadCheckbox(
            value: value,
            onChanged: (v) => setState(() => value = v),
            label: const Text('Accept terms and conditions'),
            sublabel: const Text(
              'You agree to our Terms of Service and Privacy Policy.',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ShadContextMenuRegion(
              constraints: const BoxConstraints(minWidth: 300),
              items: [
                const ShadContextMenuItem.inset(
                  child: Text('Back'),
                ),
                const ShadContextMenuItem.inset(
                  enabled: false,
                  child: Text('Forward'),
                ),
                const ShadContextMenuItem.inset(
                  child: Text('Reload'),
                ),
                const ShadContextMenuItem.inset(
                  trailing: Icon(LucideIcons.chevronRight),
                  items: [
                    ShadContextMenuItem(
                      child: Text('Save Page As...'),
                    ),
                    ShadContextMenuItem(
                      child: Text('Create Shortcut...'),
                    ),
                    ShadContextMenuItem(
                      child: Text('Name Window...'),
                    ),
                    Divider(height: 8),
                    ShadContextMenuItem(
                      child: Text('Developer Tools'),
                    ),
                  ],
                  child: Text('More Tools'),
                ),
                const Divider(height: 8),
                const ShadContextMenuItem(
                  leading: Icon(LucideIcons.check),
                  child: Text('Show Bookmarks Bar'),
                ),
                const ShadContextMenuItem.inset(child: Text('Show Full URLs')),
                const Divider(height: 8),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 8, 8, 8),
                  child: Text('People', style: theme.textTheme.small),
                ),
                const Divider(height: 8),
                ShadContextMenuItem(
                  leading: SizedBox.square(
                    dimension: 16,
                    child: Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.foreground,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  child: const Text('Pedro Duarte'),
                ),
                const ShadContextMenuItem.inset(child: Text('Colm Tuite')),
              ],
              child: Container(
                width: 300,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colorScheme.border),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Right click here'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final details = [
  (
  title: 'Is it acceptable?',
  content: 'Yes. It adheres to the WAI-ARIA design pattern.',
  ),
  (
  title: 'Is it styled?',
  content:
  "Yes. It comes with default styles that matches the other components' aesthetic.",
  ),
  (
  title: 'Is it animated?',
  content:
  "Yes. It's animated by default, but you can disable it if you prefer.",
  ),
];
